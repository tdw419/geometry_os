; DESCRIPTION: Draws a blue line from (69, 39) to (192, 41).
; PLAN: r0=69(x1), r1=39(y1), r2=192(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 39
LDI r2, 192
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
