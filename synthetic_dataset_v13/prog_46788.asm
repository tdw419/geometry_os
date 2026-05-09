; DESCRIPTION: Draws a black line from (501, 38) to (258, 84).
; PLAN: r0=501(x1), r1=38(y1), r2=258(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 38
LDI r2, 258
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
