; DESCRIPTION: Renders a yellow line between points (493, 199) and (491, 35).
; PLAN: r0=493(x1), r1=199(y1), r2=491(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 199
LDI r2, 491
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
