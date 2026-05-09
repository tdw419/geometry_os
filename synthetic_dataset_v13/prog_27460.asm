; DESCRIPTION: Draws a red line from (197, 34) to (336, 238).
; PLAN: r0=197(x1), r1=34(y1), r2=336(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 34
LDI r2, 336
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
