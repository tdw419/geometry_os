; DESCRIPTION: Draws a purple line from (507, 5) to (412, 162).
; PLAN: r0=507(x1), r1=5(y1), r2=412(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 5
LDI r2, 412
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
