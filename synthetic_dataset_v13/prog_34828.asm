; DESCRIPTION: Renders a yellow line between points (500, 59) and (62, 170).
; PLAN: r0=500(x1), r1=59(y1), r2=62(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 59
LDI r2, 62
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
