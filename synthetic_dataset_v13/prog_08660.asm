; DESCRIPTION: Renders a yellow line between points (169, 39) and (78, 71).
; PLAN: r0=169(x1), r1=39(y1), r2=78(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 39
LDI r2, 78
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
