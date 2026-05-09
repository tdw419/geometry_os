; DESCRIPTION: Renders a red line between points (287, 197) and (391, 100).
; PLAN: r0=287(x1), r1=197(y1), r2=391(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 197
LDI r2, 391
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
