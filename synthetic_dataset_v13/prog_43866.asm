; DESCRIPTION: Renders a blue line between points (278, 192) and (3, 249).
; PLAN: r0=278(x1), r1=192(y1), r2=3(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 192
LDI r2, 3
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
