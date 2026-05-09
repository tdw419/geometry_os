; DESCRIPTION: Renders a purple line between points (345, 46) and (469, 47).
; PLAN: r0=345(x1), r1=46(y1), r2=469(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 46
LDI r2, 469
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
