; DESCRIPTION: Draws a blue line from (458, 26) to (12, 230).
; PLAN: r0=458(x1), r1=26(y1), r2=12(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 26
LDI r2, 12
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
