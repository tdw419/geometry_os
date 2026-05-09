; DESCRIPTION: Composite: Renders a white line between points (104, 54) and (341, 21) then Renders a black disk with center (326, 156) and radius 28.
; PLAN: r0=104(x1), r1=54(y1), r2=341(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=156(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 54
LDI r2, 341
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 156
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
