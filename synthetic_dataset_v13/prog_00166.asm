; DESCRIPTION: Composite: Places a cyan dot at position (114, 185) then Places a magenta line segment connecting (376, 232) to (250, 231) then Creates a white rectangular region at (5, 51) spanning 97 by 44 pixels.
; PLAN: r0=114(x), r1=185(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=376(x1), r6=232(y1), r7=250(x2), r8=231(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=51(y), r12=97(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 185
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 232
LDI r7, 250
LDI r8, 231
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 51
LDI r12, 97
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
