; DESCRIPTION: Composite: Places a yellow line segment connecting (257, 161) to (439, 11) then Creates a white circular shape at (156, 163) with radius 75.
; PLAN: r0=257(x1), r1=161(y1), r2=439(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=163(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 257
LDI r1, 161
LDI r2, 439
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 163
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
