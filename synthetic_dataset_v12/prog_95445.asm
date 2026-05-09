; DESCRIPTION: Renders a green line between points (125, 81) and (149, 219).
; PLAN: r0=125(x1), r1=81(y1), r2=149(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 81
LDI r2, 149
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
