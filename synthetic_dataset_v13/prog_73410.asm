; DESCRIPTION: Renders a purple line between points (342, 87) and (406, 249).
; PLAN: r0=342(x1), r1=87(y1), r2=406(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 87
LDI r2, 406
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
