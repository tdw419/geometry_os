; DESCRIPTION: Composite: Draws a orange line from (424, 88) to (160, 79) then Renders a magenta box of size 87x109 starting at (81, 31) then Sets a single black pixel at (414, 192).
; PLAN: r0=424(x1), r1=88(y1), r2=160(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=31(y), r7=87(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=192(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 88
LDI r2, 160
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 31
LDI r7, 87
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 192
LDI r12, 0x000000
PSET r10, r11, r12
HALT
