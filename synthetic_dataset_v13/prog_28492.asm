; DESCRIPTION: Renders a red line between points (48, 84) and (447, 249).
; PLAN: r0=48(x1), r1=84(y1), r2=447(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 84
LDI r2, 447
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
