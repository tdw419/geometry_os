; DESCRIPTION: Composite: Draws a red line from (492, 1) to (428, 191) then Creates a red circular shape at (359, 30) with radius 12.
; PLAN: r0=492(x1), r1=1(y1), r2=428(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=30(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 1
LDI r2, 428
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 30
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
