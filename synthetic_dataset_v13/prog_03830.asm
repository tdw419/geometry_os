; DESCRIPTION: Renders a yellow line between points (488, 112) and (3, 97).
; PLAN: r0=488(x1), r1=112(y1), r2=3(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 112
LDI r2, 3
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
