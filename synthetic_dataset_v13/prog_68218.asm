; DESCRIPTION: Composite: Places a magenta 112x95 rectangle at position (267, 108) then Draws a orange line from (408, 210) to (79, 79) then Sets a single orange pixel at (322, 183).
; PLAN: r0=267(x), r1=108(y), r2=112(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x1), r6=210(y1), r7=79(x2), r8=79(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=183(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 108
LDI r2, 112
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 210
LDI r7, 79
LDI r8, 79
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 183
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
