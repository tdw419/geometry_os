; DESCRIPTION: Composite: Renders a white box of size 111x31 starting at (253, 3) then Renders a yellow line between points (237, 154) and (250, 245).
; PLAN: r0=253(x), r1=3(y), r2=111(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x1), r6=154(y1), r7=250(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 3
LDI r2, 111
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 154
LDI r7, 250
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
