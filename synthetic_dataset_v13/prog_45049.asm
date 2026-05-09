; DESCRIPTION: Draws a black line from (68, 2) to (208, 85).
; PLAN: r0=68(x1), r1=2(y1), r2=208(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 2
LDI r2, 208
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
