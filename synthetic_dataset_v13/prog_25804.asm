; DESCRIPTION: Composite: Creates a black circular shape at (289, 165) with radius 78 then Places a magenta line segment connecting (481, 115) to (253, 89).
; PLAN: r0=289(x), r1=165(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=115(y1), r7=253(x2), r8=89(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 165
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 115
LDI r7, 253
LDI r8, 89
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
