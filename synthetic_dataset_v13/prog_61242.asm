; DESCRIPTION: Composite: Creates a magenta rectangular region at (172, 152) spanning 30 by 78 pixels then Sets a single yellow pixel at (356, 117) then Creates a black circular shape at (199, 166) with radius 36.
; PLAN: r0=172(x), r1=152(y), r2=30(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=117(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=166(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 152
LDI r2, 30
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 117
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 199
LDI r11, 166
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
