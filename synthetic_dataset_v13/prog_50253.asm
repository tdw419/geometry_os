; DESCRIPTION: Draws a magenta line from (172, 65) to (311, 115).
; PLAN: r0=172(x1), r1=65(y1), r2=311(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 65
LDI r2, 311
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
