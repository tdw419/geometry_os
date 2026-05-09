; DESCRIPTION: Renders a white line between points (279, 156) and (274, 232).
; PLAN: r0=279(x1), r1=156(y1), r2=274(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 156
LDI r2, 274
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
