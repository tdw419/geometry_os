; DESCRIPTION: Renders a red line between points (325, 75) and (146, 218).
; PLAN: r0=325(x1), r1=75(y1), r2=146(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 75
LDI r2, 146
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
