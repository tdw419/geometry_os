; DESCRIPTION: Composite: Draws a red line from (317, 12) to (23, 2) then Creates a black circular shape at (268, 139) with radius 56 then Sets a single green pixel at (505, 25).
; PLAN: r0=317(x1), r1=12(y1), r2=23(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=139(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x), r11=25(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 12
LDI r2, 23
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 139
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 25
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
