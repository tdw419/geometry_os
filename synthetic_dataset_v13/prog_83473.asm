; DESCRIPTION: Draws a blue line from (161, 171) to (378, 254).
; PLAN: r0=161(x1), r1=171(y1), r2=378(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 171
LDI r2, 378
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
