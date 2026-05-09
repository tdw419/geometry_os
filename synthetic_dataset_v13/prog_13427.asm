; DESCRIPTION: Composite: Sets a single blue pixel at (109, 199) then Places a orange 64x77 rectangle at position (183, 134) then Renders a magenta line between points (304, 100) and (389, 78).
; PLAN: r0=109(x), r1=199(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=134(y), r7=64(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x1), r11=100(y1), r12=389(x2), r13=78(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 199
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 134
LDI r7, 64
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 100
LDI r12, 389
LDI r13, 78
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
