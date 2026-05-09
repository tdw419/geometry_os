; DESCRIPTION: Composite: Renders a green disk with center (253, 54) and radius 15 then Renders a magenta line between points (122, 109) and (452, 0).
; PLAN: r0=253(x), r1=54(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=109(y1), r7=452(x2), r8=0(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 54
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 109
LDI r7, 452
LDI r8, 0
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
