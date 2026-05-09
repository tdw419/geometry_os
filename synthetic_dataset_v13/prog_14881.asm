; DESCRIPTION: Renders a red line between points (94, 221) and (172, 30).
; PLAN: r0=94(x1), r1=221(y1), r2=172(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 221
LDI r2, 172
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
