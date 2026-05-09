; DESCRIPTION: Composite: Draws a cyan line from (483, 50) to (156, 108) then Renders a magenta box of size 11x104 starting at (287, 116) then Sets a single blue pixel at (244, 50).
; PLAN: r0=483(x1), r1=50(y1), r2=156(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=116(y), r7=11(width), r8=104(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=50(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 50
LDI r2, 156
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 116
LDI r7, 11
LDI r8, 104
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 50
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
