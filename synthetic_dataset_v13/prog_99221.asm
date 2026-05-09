; DESCRIPTION: Draws a red line from (507, 220) to (168, 98).
; PLAN: r0=507(x1), r1=220(y1), r2=168(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 220
LDI r2, 168
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
