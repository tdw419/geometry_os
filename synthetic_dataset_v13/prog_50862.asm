; DESCRIPTION: Renders a purple line between points (380, 120) and (493, 119).
; PLAN: r0=380(x1), r1=120(y1), r2=493(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 120
LDI r2, 493
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
