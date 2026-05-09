; DESCRIPTION: Draws a blue line from (238, 170) to (122, 108).
; PLAN: r0=238(x1), r1=170(y1), r2=122(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 170
LDI r2, 122
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
