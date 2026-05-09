; DESCRIPTION: Renders a yellow line between points (169, 54) and (368, 88).
; PLAN: r0=169(x1), r1=54(y1), r2=368(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 54
LDI r2, 368
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
