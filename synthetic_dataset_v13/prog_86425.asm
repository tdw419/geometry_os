; DESCRIPTION: Composite: Places a red line segment connecting (251, 185) to (178, 23) then Creates a yellow circular shape at (301, 190) with radius 63.
; PLAN: r0=251(x1), r1=185(y1), r2=178(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=190(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 185
LDI r2, 178
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 190
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
