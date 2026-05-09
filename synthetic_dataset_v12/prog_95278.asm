; DESCRIPTION: Renders a yellow line between points (11, 81) and (189, 180).
; PLAN: r0=11(x1), r1=81(y1), r2=189(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 81
LDI r2, 189
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
