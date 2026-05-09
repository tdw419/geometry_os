; DESCRIPTION: Draws a magenta line from (68, 36) to (411, 188).
; PLAN: r0=68(x1), r1=36(y1), r2=411(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 36
LDI r2, 411
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
