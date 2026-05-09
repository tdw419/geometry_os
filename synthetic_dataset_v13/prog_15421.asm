; DESCRIPTION: Draws a blue line from (351, 161) to (499, 234).
; PLAN: r0=351(x1), r1=161(y1), r2=499(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 161
LDI r2, 499
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
