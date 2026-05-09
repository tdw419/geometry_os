; DESCRIPTION: Renders a red line between points (396, 92) and (180, 64).
; PLAN: r0=396(x1), r1=92(y1), r2=180(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 92
LDI r2, 180
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
