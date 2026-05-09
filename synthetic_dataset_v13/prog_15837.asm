; DESCRIPTION: Composite: Places a purple line segment connecting (386, 134) to (77, 191) then Creates a purple circular shape at (167, 144) with radius 71.
; PLAN: r0=386(x1), r1=134(y1), r2=77(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=144(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 386
LDI r1, 134
LDI r2, 77
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 144
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
