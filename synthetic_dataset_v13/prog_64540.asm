; DESCRIPTION: Draws a black line from (26, 181) to (193, 4).
; PLAN: r0=26(x1), r1=181(y1), r2=193(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 181
LDI r2, 193
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
