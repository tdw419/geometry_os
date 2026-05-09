; DESCRIPTION: Renders a yellow line between points (481, 115) and (170, 65).
; PLAN: r0=481(x1), r1=115(y1), r2=170(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 115
LDI r2, 170
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
