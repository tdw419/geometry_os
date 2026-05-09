; DESCRIPTION: Places a yellow line segment connecting (65, 73) to (233, 140).
; PLAN: r0=65(x1), r1=73(y1), r2=233(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 73
LDI r2, 233
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
