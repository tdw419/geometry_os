; DESCRIPTION: Renders a purple line between points (134, 30) and (234, 209).
; PLAN: r0=134(x1), r1=30(y1), r2=234(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 30
LDI r2, 234
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
