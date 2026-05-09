; DESCRIPTION: Renders a purple line between points (313, 241) and (182, 89).
; PLAN: r0=313(x1), r1=241(y1), r2=182(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 241
LDI r2, 182
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
