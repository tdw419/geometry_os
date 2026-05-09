; DESCRIPTION: Places a red line segment connecting (29, 221) to (197, 82).
; PLAN: r0=29(x1), r1=221(y1), r2=197(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 221
LDI r2, 197
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
