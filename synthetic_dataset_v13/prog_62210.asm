; DESCRIPTION: Draws a blue line from (463, 123) to (411, 234).
; PLAN: r0=463(x1), r1=123(y1), r2=411(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 123
LDI r2, 411
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
