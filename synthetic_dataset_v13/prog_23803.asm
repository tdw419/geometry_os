; DESCRIPTION: Draws a blue line from (351, 66) to (240, 44).
; PLAN: r0=351(x1), r1=66(y1), r2=240(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 66
LDI r2, 240
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
