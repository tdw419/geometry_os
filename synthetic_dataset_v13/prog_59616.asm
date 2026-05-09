; DESCRIPTION: Places a yellow line segment connecting (233, 212) to (439, 92).
; PLAN: r0=233(x1), r1=212(y1), r2=439(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 212
LDI r2, 439
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
