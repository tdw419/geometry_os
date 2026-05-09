; DESCRIPTION: Renders a purple line between points (81, 121) and (283, 134).
; PLAN: r0=81(x1), r1=121(y1), r2=283(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 121
LDI r2, 283
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
