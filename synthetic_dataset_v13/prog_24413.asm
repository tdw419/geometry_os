; DESCRIPTION: Renders a red line between points (447, 149) and (506, 58).
; PLAN: r0=447(x1), r1=149(y1), r2=506(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 149
LDI r2, 506
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
