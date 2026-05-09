; DESCRIPTION: Renders a yellow line between points (229, 192) and (500, 209).
; PLAN: r0=229(x1), r1=192(y1), r2=500(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 192
LDI r2, 500
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
