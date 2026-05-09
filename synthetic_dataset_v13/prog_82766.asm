; DESCRIPTION: Places a yellow line segment connecting (95, 240) to (406, 75).
; PLAN: r0=95(x1), r1=240(y1), r2=406(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 240
LDI r2, 406
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
