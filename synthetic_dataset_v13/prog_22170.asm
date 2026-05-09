; DESCRIPTION: Renders a green line between points (52, 179) and (407, 232).
; PLAN: r0=52(x1), r1=179(y1), r2=407(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 179
LDI r2, 407
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
