; DESCRIPTION: Composite: Draws a yellow line from (504, 201) to (439, 93) then Creates a yellow circular shape at (282, 45) with radius 38.
; PLAN: r0=504(x1), r1=201(y1), r2=439(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=45(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 504
LDI r1, 201
LDI r2, 439
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 45
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
