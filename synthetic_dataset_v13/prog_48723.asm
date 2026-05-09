; DESCRIPTION: Draws a black line from (501, 108) to (300, 118).
; PLAN: r0=501(x1), r1=108(y1), r2=300(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 108
LDI r2, 300
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
