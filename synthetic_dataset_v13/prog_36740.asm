; DESCRIPTION: Draws a magenta line from (9, 30) to (159, 180).
; PLAN: r0=9(x1), r1=30(y1), r2=159(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 30
LDI r2, 159
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
