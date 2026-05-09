; DESCRIPTION: Renders a red line between points (14, 180) and (353, 64).
; PLAN: r0=14(x1), r1=180(y1), r2=353(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 180
LDI r2, 353
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
