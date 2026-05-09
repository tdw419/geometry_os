; DESCRIPTION: Draws a red line from (494, 164) to (507, 34).
; PLAN: r0=494(x1), r1=164(y1), r2=507(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 164
LDI r2, 507
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
