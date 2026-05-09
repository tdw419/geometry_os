; DESCRIPTION: Composite: Places a purple line segment connecting (123, 144) to (257, 212) then Renders a white disk with center (128, 156) and radius 71.
; PLAN: r0=123(x1), r1=144(y1), r2=257(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=156(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 144
LDI r2, 257
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 156
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
