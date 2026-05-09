; DESCRIPTION: Draws a magenta line from (292, 118) to (283, 141).
; PLAN: r0=292(x1), r1=118(y1), r2=283(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 118
LDI r2, 283
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
