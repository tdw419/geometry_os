; DESCRIPTION: Renders a yellow line between points (358, 52) and (139, 37).
; PLAN: r0=358(x1), r1=52(y1), r2=139(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 52
LDI r2, 139
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
