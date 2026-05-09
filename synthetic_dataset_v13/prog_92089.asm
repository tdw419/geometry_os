; DESCRIPTION: Draws a red line from (476, 36) to (507, 237).
; PLAN: r0=476(x1), r1=36(y1), r2=507(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 36
LDI r2, 507
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
