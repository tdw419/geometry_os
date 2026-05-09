; DESCRIPTION: Draws a magenta line from (358, 148) to (299, 133).
; PLAN: r0=358(x1), r1=148(y1), r2=299(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 148
LDI r2, 299
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
