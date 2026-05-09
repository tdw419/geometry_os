; DESCRIPTION: Renders a green line between points (112, 88) and (120, 153).
; PLAN: r0=112(x1), r1=88(y1), r2=120(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 88
LDI r2, 120
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
