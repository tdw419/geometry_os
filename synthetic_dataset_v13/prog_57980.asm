; DESCRIPTION: Renders a purple line between points (333, 30) and (458, 92).
; PLAN: r0=333(x1), r1=30(y1), r2=458(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 30
LDI r2, 458
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
