; DESCRIPTION: Draws a green line from (35, 6) to (463, 85).
; PLAN: r0=35(x1), r1=6(y1), r2=463(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 6
LDI r2, 463
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
