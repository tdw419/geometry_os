; DESCRIPTION: Composite: Renders a white box of size 61x11 starting at (138, 230) then Places a green line segment connecting (137, 111) to (77, 71) then Sets a single red pixel at (448, 104).
; PLAN: r0=138(x), r1=230(y), r2=61(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=111(y1), r7=77(x2), r8=71(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=104(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 230
LDI r2, 61
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 111
LDI r7, 77
LDI r8, 71
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 104
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
