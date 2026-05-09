; DESCRIPTION: Draws a blue line from (496, 132) to (161, 143).
; PLAN: r0=496(x1), r1=132(y1), r2=161(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 132
LDI r2, 161
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
