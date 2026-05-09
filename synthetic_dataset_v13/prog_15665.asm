; DESCRIPTION: Draws a magenta line from (30, 5) to (159, 112).
; PLAN: r0=30(x1), r1=5(y1), r2=159(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 5
LDI r2, 159
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
