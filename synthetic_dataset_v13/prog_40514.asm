; DESCRIPTION: Composite: Places a orange dot at position (199, 171) then Creates a yellow rectangular region at (356, 22) spanning 84 by 98 pixels then Places a blue line segment connecting (80, 23) to (218, 118).
; PLAN: r0=199(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=22(y), r7=84(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x1), r11=23(y1), r12=218(x2), r13=118(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 356
LDI r6, 22
LDI r7, 84
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 23
LDI r12, 218
LDI r13, 118
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
