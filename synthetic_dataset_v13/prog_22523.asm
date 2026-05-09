; DESCRIPTION: Composite: Sets a single green pixel at (389, 214) then Places a black line segment connecting (96, 239) to (501, 113) then Places a white 73x24 rectangle at position (124, 127).
; PLAN: r0=389(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=239(y1), r7=501(x2), r8=113(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=127(y), r12=73(width), r13=24(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 96
LDI r6, 239
LDI r7, 501
LDI r8, 113
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 127
LDI r12, 73
LDI r13, 24
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
