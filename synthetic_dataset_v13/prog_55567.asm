; DESCRIPTION: Renders a purple line between points (253, 1) and (234, 33).
; PLAN: r0=253(x1), r1=1(y1), r2=234(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 1
LDI r2, 234
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
