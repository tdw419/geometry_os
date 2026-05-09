; DESCRIPTION: Draws a yellow line from (45, 105) to (463, 3).
; PLAN: r0=45(x1), r1=105(y1), r2=463(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 105
LDI r2, 463
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
