; DESCRIPTION: Renders a red line between points (115, 56) and (447, 223).
; PLAN: r0=115(x1), r1=56(y1), r2=447(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 56
LDI r2, 447
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
