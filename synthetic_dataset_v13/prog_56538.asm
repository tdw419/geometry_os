; DESCRIPTION: Draws a blue line from (311, 66) to (167, 203).
; PLAN: r0=311(x1), r1=66(y1), r2=167(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 66
LDI r2, 167
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
