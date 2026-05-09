; DESCRIPTION: Renders a blue line between points (283, 81) and (117, 189).
; PLAN: r0=283(x1), r1=81(y1), r2=117(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 81
LDI r2, 117
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
