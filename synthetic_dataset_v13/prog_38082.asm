; DESCRIPTION: Composite: Places a green line segment connecting (508, 30) to (35, 144) then Creates a red circular shape at (283, 176) with radius 20.
; PLAN: r0=508(x1), r1=30(y1), r2=35(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=176(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 508
LDI r1, 30
LDI r2, 35
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 176
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
