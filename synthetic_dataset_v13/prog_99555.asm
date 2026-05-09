; DESCRIPTION: Draws a magenta line from (304, 118) to (334, 194).
; PLAN: r0=304(x1), r1=118(y1), r2=334(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 118
LDI r2, 334
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
