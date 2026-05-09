; DESCRIPTION: Draws a black line from (66, 123) to (106, 120).
; PLAN: r0=66(x1), r1=123(y1), r2=106(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 123
LDI r2, 106
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
