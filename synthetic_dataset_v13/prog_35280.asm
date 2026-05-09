; DESCRIPTION: Draws a blue line from (174, 56) to (351, 93).
; PLAN: r0=174(x1), r1=56(y1), r2=351(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 56
LDI r2, 351
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
