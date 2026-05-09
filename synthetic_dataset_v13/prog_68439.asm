; DESCRIPTION: Draws a blue line from (250, 69) to (507, 176).
; PLAN: r0=250(x1), r1=69(y1), r2=507(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 69
LDI r2, 507
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
