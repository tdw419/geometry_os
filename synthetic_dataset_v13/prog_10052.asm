; DESCRIPTION: Draws a blue line from (95, 221) to (13, 158).
; PLAN: r0=95(x1), r1=221(y1), r2=13(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 221
LDI r2, 13
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
