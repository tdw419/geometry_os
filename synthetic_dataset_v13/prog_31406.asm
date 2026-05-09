; DESCRIPTION: Renders a purple line between points (509, 154) and (109, 161).
; PLAN: r0=509(x1), r1=154(y1), r2=109(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 154
LDI r2, 109
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
