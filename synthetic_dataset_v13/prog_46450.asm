; DESCRIPTION: Draws a red line from (123, 40) to (238, 153).
; PLAN: r0=123(x1), r1=40(y1), r2=238(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 40
LDI r2, 238
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
