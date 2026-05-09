; DESCRIPTION: Composite: Sets a single blue pixel at (353, 215) then Creates a green rectangular region at (346, 0) spanning 31 by 92 pixels then Draws a purple circle centered at (167, 112) with radius 58.
; PLAN: r0=353(x), r1=215(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=0(y), r7=31(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x), r11=112(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 215
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 0
LDI r7, 31
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 112
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
