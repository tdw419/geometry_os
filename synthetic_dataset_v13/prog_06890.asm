; DESCRIPTION: Draws a green line from (10, 105) to (6, 162).
; PLAN: r0=10(x1), r1=105(y1), r2=6(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 105
LDI r2, 6
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
