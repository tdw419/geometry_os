; DESCRIPTION: Draws a black line from (119, 178) to (142, 75).
; PLAN: r0=119(x1), r1=178(y1), r2=142(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 178
LDI r2, 142
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
