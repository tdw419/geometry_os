; DESCRIPTION: Renders a yellow line between points (237, 177) and (77, 24).
; PLAN: r0=237(x1), r1=177(y1), r2=77(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 177
LDI r2, 77
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
