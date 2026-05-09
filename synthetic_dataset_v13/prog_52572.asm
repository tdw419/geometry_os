; DESCRIPTION: Places a yellow line segment connecting (410, 62) to (124, 136).
; PLAN: r0=410(x1), r1=62(y1), r2=124(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 62
LDI r2, 124
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
