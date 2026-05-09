; DESCRIPTION: Renders a yellow line between points (67, 229) and (172, 49).
; PLAN: r0=67(x1), r1=229(y1), r2=172(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 229
LDI r2, 172
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
