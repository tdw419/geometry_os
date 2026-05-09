; DESCRIPTION: Draws a black line from (472, 60) to (195, 191).
; PLAN: r0=472(x1), r1=60(y1), r2=195(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 60
LDI r2, 195
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
