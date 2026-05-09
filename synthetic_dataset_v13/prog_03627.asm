; DESCRIPTION: Composite: Renders a purple box of size 47x89 starting at (142, 20) then Renders a purple disk with center (147, 178) and radius 47.
; PLAN: r0=142(x), r1=20(y), r2=47(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=178(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 20
LDI r2, 47
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 178
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
