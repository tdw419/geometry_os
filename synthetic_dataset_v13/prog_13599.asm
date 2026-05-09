; DESCRIPTION: Composite: Renders a orange line between points (411, 230) and (243, 9) then Places a blue circle of radius 36 at center (83, 94) then Sets a single white pixel at (313, 183).
; PLAN: r0=411(x1), r1=230(y1), r2=243(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=94(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=183(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 230
LDI r2, 243
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 94
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 183
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
