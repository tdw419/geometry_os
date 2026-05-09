; DESCRIPTION: Draws a purple line from (507, 179) to (412, 108).
; PLAN: r0=507(x1), r1=179(y1), r2=412(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 179
LDI r2, 412
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
