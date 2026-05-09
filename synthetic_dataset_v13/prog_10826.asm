; DESCRIPTION: Draws a magenta line from (238, 210) to (97, 229).
; PLAN: r0=238(x1), r1=210(y1), r2=97(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 210
LDI r2, 97
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
