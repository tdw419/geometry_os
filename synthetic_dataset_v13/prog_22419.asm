; DESCRIPTION: Composite: Sets a single yellow pixel at (264, 235) then Places a magenta line segment connecting (21, 88) to (71, 148) then Creates a yellow circular shape at (467, 202) with radius 40.
; PLAN: r0=264(x), r1=235(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=88(y1), r7=71(x2), r8=148(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=467(x), r11=202(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 235
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 21
LDI r6, 88
LDI r7, 71
LDI r8, 148
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 202
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
