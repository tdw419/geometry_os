; DESCRIPTION: Renders a yellow line between points (412, 71) and (161, 7).
; PLAN: r0=412(x1), r1=71(y1), r2=161(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 71
LDI r2, 161
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
