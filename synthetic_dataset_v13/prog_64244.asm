; DESCRIPTION: Draws a black line from (159, 62) to (468, 75).
; PLAN: r0=159(x1), r1=62(y1), r2=468(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 62
LDI r2, 468
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
