; DESCRIPTION: Renders a purple line between points (399, 154) and (270, 242).
; PLAN: r0=399(x1), r1=154(y1), r2=270(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 154
LDI r2, 270
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
