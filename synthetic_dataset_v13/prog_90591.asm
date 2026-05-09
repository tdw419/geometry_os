; DESCRIPTION: Draws a blue line from (46, 176) to (378, 133).
; PLAN: r0=46(x1), r1=176(y1), r2=378(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 176
LDI r2, 378
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
