; DESCRIPTION: Draws a black line from (106, 72) to (170, 89).
; PLAN: r0=106(x1), r1=72(y1), r2=170(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 72
LDI r2, 170
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
