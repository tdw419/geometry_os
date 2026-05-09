; DESCRIPTION: Renders a purple line between points (154, 40) and (71, 183).
; PLAN: r0=154(x1), r1=40(y1), r2=71(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 40
LDI r2, 71
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
