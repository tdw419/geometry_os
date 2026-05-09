; DESCRIPTION: Renders a yellow line between points (481, 181) and (222, 162).
; PLAN: r0=481(x1), r1=181(y1), r2=222(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 181
LDI r2, 222
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
