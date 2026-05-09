; DESCRIPTION: Composite: Places a magenta dot at position (429, 99) then Renders a green box of size 80x116 starting at (45, 8) then Draws a black line from (327, 85) to (109, 106).
; PLAN: r0=429(x), r1=99(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=8(y), r7=80(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x1), r11=85(y1), r12=109(x2), r13=106(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 99
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 8
LDI r7, 80
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 85
LDI r12, 109
LDI r13, 106
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
