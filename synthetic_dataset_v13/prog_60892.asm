; DESCRIPTION: Renders a yellow line between points (237, 9) and (134, 34).
; PLAN: r0=237(x1), r1=9(y1), r2=134(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 9
LDI r2, 134
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
