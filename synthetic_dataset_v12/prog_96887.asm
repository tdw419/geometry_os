; DESCRIPTION: Renders a green line between points (213, 15) and (141, 130).
; PLAN: r0=213(x1), r1=15(y1), r2=141(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 15
LDI r2, 141
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
