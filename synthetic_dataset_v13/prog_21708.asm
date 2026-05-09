; DESCRIPTION: Renders a yellow line between points (81, 73) and (502, 185).
; PLAN: r0=81(x1), r1=73(y1), r2=502(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 73
LDI r2, 502
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
