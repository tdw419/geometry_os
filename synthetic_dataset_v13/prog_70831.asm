; DESCRIPTION: Draws a blue line from (52, 221) to (507, 180).
; PLAN: r0=52(x1), r1=221(y1), r2=507(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 221
LDI r2, 507
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
