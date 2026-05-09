; DESCRIPTION: Draws a black line from (463, 105) to (303, 229).
; PLAN: r0=463(x1), r1=105(y1), r2=303(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 105
LDI r2, 303
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
