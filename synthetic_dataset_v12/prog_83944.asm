; DESCRIPTION: Draws a blue line from (81, 2) to (463, 248).
; PLAN: r0=81(x1), r1=2(y1), r2=463(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 2
LDI r2, 463
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
