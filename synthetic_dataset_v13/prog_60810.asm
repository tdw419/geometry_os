; DESCRIPTION: Draws a blue line from (211, 44) to (14, 167).
; PLAN: r0=211(x1), r1=44(y1), r2=14(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 44
LDI r2, 14
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
