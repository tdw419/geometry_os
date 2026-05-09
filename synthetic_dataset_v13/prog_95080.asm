; DESCRIPTION: Draws a black line from (216, 171) to (463, 136).
; PLAN: r0=216(x1), r1=171(y1), r2=463(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 171
LDI r2, 463
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
