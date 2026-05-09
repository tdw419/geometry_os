; DESCRIPTION: Renders a blue line between points (493, 28) and (374, 15).
; PLAN: r0=493(x1), r1=28(y1), r2=374(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 28
LDI r2, 374
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
