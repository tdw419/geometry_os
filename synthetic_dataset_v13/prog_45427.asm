; DESCRIPTION: Renders a purple line between points (58, 100) and (425, 187).
; PLAN: r0=58(x1), r1=100(y1), r2=425(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 100
LDI r2, 425
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
