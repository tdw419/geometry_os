; DESCRIPTION: Renders a yellow line between points (335, 158) and (493, 180).
; PLAN: r0=335(x1), r1=158(y1), r2=493(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 158
LDI r2, 493
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
