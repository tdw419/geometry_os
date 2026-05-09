; DESCRIPTION: Places a yellow line segment connecting (406, 180) to (444, 148).
; PLAN: r0=406(x1), r1=180(y1), r2=444(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 180
LDI r2, 444
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
