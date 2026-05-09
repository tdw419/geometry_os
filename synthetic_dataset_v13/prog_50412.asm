; DESCRIPTION: Renders a magenta line between points (310, 107) and (194, 248).
; PLAN: r0=310(x1), r1=107(y1), r2=194(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 107
LDI r2, 194
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
