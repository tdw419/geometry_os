; DESCRIPTION: Renders a red line between points (257, 233) and (484, 168).
; PLAN: r0=257(x1), r1=233(y1), r2=484(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 233
LDI r2, 484
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
