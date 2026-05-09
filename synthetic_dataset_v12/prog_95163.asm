; DESCRIPTION: Composite: Places a magenta line segment connecting (413, 0) to (98, 171) then Creates a green rectangular region at (65, 194) spanning 45 by 51 pixels then Draws a green circle centered at (408, 191) with radius 29.
; PLAN: r0=413(x1), r1=0(y1), r2=98(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=194(y), r7=45(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=191(y), r12=29(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 0
LDI r2, 98
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 194
LDI r7, 45
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 191
LDI r12, 29
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
