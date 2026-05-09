; DESCRIPTION: Renders a purple line between points (283, 40) and (304, 198).
; PLAN: r0=283(x1), r1=40(y1), r2=304(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 40
LDI r2, 304
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
