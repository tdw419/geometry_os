; DESCRIPTION: Renders a yellow line between points (253, 152) and (94, 123).
; PLAN: r0=253(x1), r1=152(y1), r2=94(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 152
LDI r2, 94
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
