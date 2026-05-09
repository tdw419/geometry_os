; DESCRIPTION: Draws a black line from (444, 159) to (133, 142).
; PLAN: r0=444(x1), r1=159(y1), r2=133(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 159
LDI r2, 133
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
