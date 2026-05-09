; DESCRIPTION: Renders a yellow line between points (331, 109) and (39, 14).
; PLAN: r0=331(x1), r1=109(y1), r2=39(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 109
LDI r2, 39
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
