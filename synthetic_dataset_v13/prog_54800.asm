; DESCRIPTION: Renders a yellow line between points (452, 237) and (417, 102).
; PLAN: r0=452(x1), r1=237(y1), r2=417(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 237
LDI r2, 417
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
