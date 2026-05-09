; DESCRIPTION: Draws a black line from (132, 0) to (195, 78).
; PLAN: r0=132(x1), r1=0(y1), r2=195(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 0
LDI r2, 195
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
