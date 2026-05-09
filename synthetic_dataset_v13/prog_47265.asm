; DESCRIPTION: Draws a black line from (11, 4) to (463, 176).
; PLAN: r0=11(x1), r1=4(y1), r2=463(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 4
LDI r2, 463
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
