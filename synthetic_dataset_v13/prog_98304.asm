; DESCRIPTION: Renders a red line between points (83, 212) and (84, 230).
; PLAN: r0=83(x1), r1=212(y1), r2=84(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 212
LDI r2, 84
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
