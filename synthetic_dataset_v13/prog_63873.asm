; DESCRIPTION: Renders a green line between points (423, 88) and (130, 121).
; PLAN: r0=423(x1), r1=88(y1), r2=130(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 88
LDI r2, 130
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
