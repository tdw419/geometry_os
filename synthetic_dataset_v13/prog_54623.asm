; DESCRIPTION: Renders a yellow line between points (194, 194) and (382, 36).
; PLAN: r0=194(x1), r1=194(y1), r2=382(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 194
LDI r2, 382
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
