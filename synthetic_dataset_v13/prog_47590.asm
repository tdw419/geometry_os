; DESCRIPTION: Renders a purple line between points (345, 7) and (53, 76).
; PLAN: r0=345(x1), r1=7(y1), r2=53(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 7
LDI r2, 53
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
