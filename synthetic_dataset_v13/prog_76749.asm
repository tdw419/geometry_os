; DESCRIPTION: Renders a red line between points (308, 53) and (349, 50).
; PLAN: r0=308(x1), r1=53(y1), r2=349(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 53
LDI r2, 349
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
