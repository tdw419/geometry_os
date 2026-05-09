; DESCRIPTION: Draws a orange line from (167, 248) to (373, 179).
; PLAN: r0=167(x1), r1=248(y1), r2=373(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 248
LDI r2, 373
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
