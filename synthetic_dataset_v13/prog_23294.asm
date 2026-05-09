; DESCRIPTION: Draws a magenta line from (130, 238) to (220, 158).
; PLAN: r0=130(x1), r1=238(y1), r2=220(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 238
LDI r2, 220
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
