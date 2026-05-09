; DESCRIPTION: Renders a orange line between points (216, 59) and (185, 197).
; PLAN: r0=216(x1), r1=59(y1), r2=185(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 59
LDI r2, 185
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
