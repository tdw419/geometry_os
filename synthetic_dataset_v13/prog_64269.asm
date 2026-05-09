; DESCRIPTION: Renders a green line between points (253, 104) and (237, 160).
; PLAN: r0=253(x1), r1=104(y1), r2=237(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 104
LDI r2, 237
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
