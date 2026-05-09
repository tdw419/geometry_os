; DESCRIPTION: Composite: Places a magenta line segment connecting (38, 243) to (257, 171) then Creates a black rectangular region at (275, 106) spanning 79 by 29 pixels then Sets a single blue pixel at (140, 108).
; PLAN: r0=38(x1), r1=243(y1), r2=257(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=106(y), r7=79(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x), r11=108(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 243
LDI r2, 257
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 106
LDI r7, 79
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 108
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
