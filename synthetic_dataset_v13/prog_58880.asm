; DESCRIPTION: Renders a purple line between points (268, 126) and (247, 130).
; PLAN: r0=268(x1), r1=126(y1), r2=247(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 126
LDI r2, 247
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
