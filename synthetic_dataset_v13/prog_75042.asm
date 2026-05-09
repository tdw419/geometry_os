; DESCRIPTION: Draws a magenta line from (500, 64) to (238, 250).
; PLAN: r0=500(x1), r1=64(y1), r2=238(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 64
LDI r2, 238
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
