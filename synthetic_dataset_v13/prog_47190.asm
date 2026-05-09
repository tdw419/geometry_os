; DESCRIPTION: Composite: Renders a blue line between points (251, 18) and (8, 218) then Creates a red circular shape at (240, 110) with radius 80.
; PLAN: r0=251(x1), r1=18(y1), r2=8(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=110(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 18
LDI r2, 8
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 110
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
