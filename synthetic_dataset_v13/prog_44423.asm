; DESCRIPTION: Renders a purple line between points (453, 154) and (154, 21).
; PLAN: r0=453(x1), r1=154(y1), r2=154(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 154
LDI r2, 154
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
