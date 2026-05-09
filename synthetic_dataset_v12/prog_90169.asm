; DESCRIPTION: Composite: Places a white line segment connecting (2, 22) to (249, 28) then Creates a magenta rectangular region at (325, 134) spanning 100 by 27 pixels then Sets a single blue pixel at (312, 64).
; PLAN: r0=2(x1), r1=22(y1), r2=249(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=134(y), r7=100(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=64(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 22
LDI r2, 249
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 134
LDI r7, 100
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 64
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
