; DESCRIPTION: Composite: Places a purple line segment connecting (284, 184) to (503, 156) then Renders a black disk with center (101, 218) and radius 30.
; PLAN: r0=284(x1), r1=184(y1), r2=503(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=218(y), r7=30(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 184
LDI r2, 503
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 218
LDI r7, 30
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
