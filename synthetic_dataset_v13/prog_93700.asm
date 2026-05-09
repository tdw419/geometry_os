; DESCRIPTION: Renders a blue line between points (223, 10) and (27, 191).
; PLAN: r0=223(x1), r1=10(y1), r2=27(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 10
LDI r2, 27
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
