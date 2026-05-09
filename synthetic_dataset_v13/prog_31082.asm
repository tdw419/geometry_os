; DESCRIPTION: Renders a green line between points (72, 73) and (390, 184).
; PLAN: r0=72(x1), r1=73(y1), r2=390(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 73
LDI r2, 390
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
