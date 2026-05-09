; DESCRIPTION: Places a blue line segment connecting (444, 182) to (35, 144).
; PLAN: r0=444(x1), r1=182(y1), r2=35(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 182
LDI r2, 35
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
