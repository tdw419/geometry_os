; DESCRIPTION: Draws a black line from (52, 94) to (106, 58).
; PLAN: r0=52(x1), r1=94(y1), r2=106(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 94
LDI r2, 106
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
