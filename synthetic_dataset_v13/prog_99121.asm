; DESCRIPTION: Places a yellow line segment connecting (135, 243) to (58, 163).
; PLAN: r0=135(x1), r1=243(y1), r2=58(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 243
LDI r2, 58
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
