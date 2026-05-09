; DESCRIPTION: Draws a blue line from (178, 100) to (507, 241).
; PLAN: r0=178(x1), r1=100(y1), r2=507(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 100
LDI r2, 507
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
