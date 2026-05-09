; DESCRIPTION: Renders a blue line between points (90, 91) and (162, 138).
; PLAN: r0=90(x1), r1=91(y1), r2=162(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 91
LDI r2, 162
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
