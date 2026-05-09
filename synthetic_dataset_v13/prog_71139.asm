; DESCRIPTION: Places a yellow line segment connecting (478, 35) to (240, 168).
; PLAN: r0=478(x1), r1=35(y1), r2=240(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 35
LDI r2, 240
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
