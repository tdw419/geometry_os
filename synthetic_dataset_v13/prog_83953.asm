; DESCRIPTION: Renders a blue line between points (161, 134) and (330, 130).
; PLAN: r0=161(x1), r1=134(y1), r2=330(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 134
LDI r2, 330
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
