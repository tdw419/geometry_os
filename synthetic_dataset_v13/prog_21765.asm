; DESCRIPTION: Composite: Creates a purple rectangular region at (234, 113) spanning 15 by 64 pixels then Draws a magenta line from (394, 97) to (69, 229).
; PLAN: r0=234(x), r1=113(y), r2=15(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=97(y1), r7=69(x2), r8=229(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 113
LDI r2, 15
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 97
LDI r7, 69
LDI r8, 229
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
