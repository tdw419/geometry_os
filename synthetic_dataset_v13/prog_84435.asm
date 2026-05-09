; DESCRIPTION: Renders a blue line between points (226, 40) and (226, 12).
; PLAN: r0=226(x1), r1=40(y1), r2=226(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 40
LDI r2, 226
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
