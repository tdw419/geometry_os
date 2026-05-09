; DESCRIPTION: Places a yellow line segment connecting (24, 185) to (57, 255).
; PLAN: r0=24(x1), r1=185(y1), r2=57(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 185
LDI r2, 57
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
