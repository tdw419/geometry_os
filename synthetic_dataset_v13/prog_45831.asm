; DESCRIPTION: Composite: Sets a single black pixel at (470, 18) then Places a green line segment connecting (17, 157) to (244, 7) then Draws a white rectangle at (4, 115) with width 71 and height 117.
; PLAN: r0=470(x), r1=18(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=17(x1), r6=157(y1), r7=244(x2), r8=7(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=4(x), r11=115(y), r12=71(width), r13=117(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 18
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 17
LDI r6, 157
LDI r7, 244
LDI r8, 7
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 115
LDI r12, 71
LDI r13, 117
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
