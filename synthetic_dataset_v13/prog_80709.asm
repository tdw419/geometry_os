; DESCRIPTION: Draws a blue line from (108, 83) to (230, 63).
; PLAN: r0=108(x1), r1=83(y1), r2=230(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 83
LDI r2, 230
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
