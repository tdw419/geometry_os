; DESCRIPTION: Renders a purple line between points (242, 123) and (241, 34).
; PLAN: r0=242(x1), r1=123(y1), r2=241(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 123
LDI r2, 241
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
