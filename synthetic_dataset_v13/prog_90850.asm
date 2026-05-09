; DESCRIPTION: Renders a purple line between points (189, 60) and (305, 191).
; PLAN: r0=189(x1), r1=60(y1), r2=305(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 60
LDI r2, 305
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
