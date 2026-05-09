; DESCRIPTION: Composite: Renders a magenta box of size 12x114 starting at (453, 94) then Renders a purple line between points (312, 159) and (413, 33).
; PLAN: r0=453(x), r1=94(y), r2=12(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=159(y1), r7=413(x2), r8=33(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 94
LDI r2, 12
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 159
LDI r7, 413
LDI r8, 33
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
