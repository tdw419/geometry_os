; DESCRIPTION: Draws a red line from (300, 168) to (467, 121).
; PLAN: r0=300(x1), r1=168(y1), r2=467(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 168
LDI r2, 467
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
