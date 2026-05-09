; DESCRIPTION: Renders a blue line between points (425, 55) and (96, 216).
; PLAN: r0=425(x1), r1=55(y1), r2=96(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 55
LDI r2, 96
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
