; DESCRIPTION: Draws a magenta line from (101, 31) to (179, 241).
; PLAN: r0=101(x1), r1=31(y1), r2=179(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 31
LDI r2, 179
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
