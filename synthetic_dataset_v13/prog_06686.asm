; DESCRIPTION: Draws a green line from (314, 221) to (466, 159).
; PLAN: r0=314(x1), r1=221(y1), r2=466(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 221
LDI r2, 466
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
