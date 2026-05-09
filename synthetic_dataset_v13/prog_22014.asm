; DESCRIPTION: Renders a red line between points (447, 145) and (86, 47).
; PLAN: r0=447(x1), r1=145(y1), r2=86(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 145
LDI r2, 86
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
