; DESCRIPTION: Composite: Places a purple line segment connecting (151, 203) to (189, 6) then Renders a magenta disk with center (319, 104) and radius 36.
; PLAN: r0=151(x1), r1=203(y1), r2=189(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=104(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 203
LDI r2, 189
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 104
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
