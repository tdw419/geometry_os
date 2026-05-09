; DESCRIPTION: Renders a red line between points (14, 171) and (120, 219).
; PLAN: r0=14(x1), r1=171(y1), r2=120(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 171
LDI r2, 120
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
