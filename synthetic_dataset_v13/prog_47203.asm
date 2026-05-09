; DESCRIPTION: Draws a red line from (317, 57) to (507, 163).
; PLAN: r0=317(x1), r1=57(y1), r2=507(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 57
LDI r2, 507
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
