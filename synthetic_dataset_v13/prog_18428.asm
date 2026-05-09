; DESCRIPTION: Renders a purple line between points (339, 73) and (234, 206).
; PLAN: r0=339(x1), r1=73(y1), r2=234(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 73
LDI r2, 234
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
