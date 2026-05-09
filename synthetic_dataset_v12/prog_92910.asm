; DESCRIPTION: Renders a red line between points (232, 171) and (439, 219).
; PLAN: r0=232(x1), r1=171(y1), r2=439(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 171
LDI r2, 439
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
