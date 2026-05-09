; DESCRIPTION: Renders a blue line between points (175, 253) and (89, 52).
; PLAN: r0=175(x1), r1=253(y1), r2=89(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 253
LDI r2, 89
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
