; DESCRIPTION: Renders a purple line between points (23, 211) and (264, 184).
; PLAN: r0=23(x1), r1=211(y1), r2=264(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 211
LDI r2, 264
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
