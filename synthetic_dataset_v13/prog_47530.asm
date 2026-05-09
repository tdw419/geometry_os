; DESCRIPTION: Composite: Sets a single blue pixel at (92, 236) then Creates a green rectangular region at (31, 163) spanning 22 by 87 pixels then Renders a white disk with center (159, 189) and radius 13.
; PLAN: r0=92(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=163(y), r7=22(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=189(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 31
LDI r6, 163
LDI r7, 22
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 189
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
