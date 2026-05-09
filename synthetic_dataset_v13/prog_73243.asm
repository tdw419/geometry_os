; DESCRIPTION: Renders a yellow line between points (378, 29) and (144, 19).
; PLAN: r0=378(x1), r1=29(y1), r2=144(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 29
LDI r2, 144
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
