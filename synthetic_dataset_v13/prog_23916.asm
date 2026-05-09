; DESCRIPTION: Draws a blue line from (12, 138) to (343, 159).
; PLAN: r0=12(x1), r1=138(y1), r2=343(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 138
LDI r2, 343
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
