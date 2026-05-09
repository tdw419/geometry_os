; DESCRIPTION: Draws a magenta line from (223, 164) to (15, 136).
; PLAN: r0=223(x1), r1=164(y1), r2=15(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 164
LDI r2, 15
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
