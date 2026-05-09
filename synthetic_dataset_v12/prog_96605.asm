; DESCRIPTION: Renders a red line between points (493, 15) and (314, 20).
; PLAN: r0=493(x1), r1=15(y1), r2=314(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 15
LDI r2, 314
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
