; DESCRIPTION: Composite: Creates a purple circular shape at (152, 174) with radius 73 then Renders a purple line between points (12, 177) and (418, 73).
; PLAN: r0=152(x), r1=174(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x1), r6=177(y1), r7=418(x2), r8=73(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 174
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 177
LDI r7, 418
LDI r8, 73
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
