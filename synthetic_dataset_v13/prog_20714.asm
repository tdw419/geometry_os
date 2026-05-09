; DESCRIPTION: Renders a red line between points (201, 197) and (503, 38).
; PLAN: r0=201(x1), r1=197(y1), r2=503(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 197
LDI r2, 503
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
