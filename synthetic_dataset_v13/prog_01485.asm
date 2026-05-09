; DESCRIPTION: Draws a blue line from (309, 66) to (438, 142).
; PLAN: r0=309(x1), r1=66(y1), r2=438(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 66
LDI r2, 438
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
