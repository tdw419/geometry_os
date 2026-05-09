; DESCRIPTION: Renders a yellow line between points (493, 0) and (462, 48).
; PLAN: r0=493(x1), r1=0(y1), r2=462(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 0
LDI r2, 462
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
