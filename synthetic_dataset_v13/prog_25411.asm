; DESCRIPTION: Renders a yellow line between points (213, 12) and (247, 130).
; PLAN: r0=213(x1), r1=12(y1), r2=247(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 12
LDI r2, 247
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
