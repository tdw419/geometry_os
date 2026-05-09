; DESCRIPTION: Draws a red line from (507, 180) to (476, 135).
; PLAN: r0=507(x1), r1=180(y1), r2=476(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 180
LDI r2, 476
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
