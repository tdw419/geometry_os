; DESCRIPTION: Composite: Draws a black circle centered at (120, 77) with radius 17 then Places a blue line segment connecting (485, 106) to (301, 57) then Places a red dot at position (318, 1).
; PLAN: r0=120(x), r1=77(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x1), r6=106(y1), r7=301(x2), r8=57(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=1(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 77
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 106
LDI r7, 301
LDI r8, 57
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 1
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
