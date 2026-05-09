; DESCRIPTION: Renders a blue line between points (457, 138) and (375, 176).
; PLAN: r0=457(x1), r1=138(y1), r2=375(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 138
LDI r2, 375
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
