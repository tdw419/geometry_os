; DESCRIPTION: Renders a yellow line between points (279, 218) and (241, 52).
; PLAN: r0=279(x1), r1=218(y1), r2=241(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 218
LDI r2, 241
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
