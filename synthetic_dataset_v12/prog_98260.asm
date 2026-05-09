; DESCRIPTION: Renders a blue line between points (493, 222) and (115, 203).
; PLAN: r0=493(x1), r1=222(y1), r2=115(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 222
LDI r2, 115
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
