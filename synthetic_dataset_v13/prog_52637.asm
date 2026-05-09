; DESCRIPTION: Renders a purple line between points (402, 23) and (247, 221).
; PLAN: r0=402(x1), r1=23(y1), r2=247(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 23
LDI r2, 247
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
