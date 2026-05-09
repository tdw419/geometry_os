; DESCRIPTION: Composite: Places a red line segment connecting (426, 219) to (87, 89) then Draws a yellow circle centered at (227, 90) with radius 56 then Places a red dot at position (23, 4).
; PLAN: r0=426(x1), r1=219(y1), r2=87(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=90(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x), r11=4(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 219
LDI r2, 87
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 90
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 4
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
