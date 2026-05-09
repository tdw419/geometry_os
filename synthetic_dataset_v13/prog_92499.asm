; DESCRIPTION: Renders a yellow line between points (177, 103) and (77, 23).
; PLAN: r0=177(x1), r1=103(y1), r2=77(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 103
LDI r2, 77
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
