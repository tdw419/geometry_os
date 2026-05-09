; DESCRIPTION: Draws a yellow line from (268, 100) to (31, 246).
; PLAN: r0=268(x1), r1=100(y1), r2=31(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 100
LDI r2, 31
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
