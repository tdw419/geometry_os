; DESCRIPTION: Places a green line segment connecting (266, 20) to (175, 153).
; PLAN: r0=266(x1), r1=20(y1), r2=175(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 20
LDI r2, 175
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
