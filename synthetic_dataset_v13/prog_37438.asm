; DESCRIPTION: Renders a purple line between points (461, 245) and (154, 52).
; PLAN: r0=461(x1), r1=245(y1), r2=154(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 245
LDI r2, 154
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
