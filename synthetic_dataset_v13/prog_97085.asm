; DESCRIPTION: Draws a blue line from (99, 132) to (82, 121).
; PLAN: r0=99(x1), r1=132(y1), r2=82(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 132
LDI r2, 82
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
