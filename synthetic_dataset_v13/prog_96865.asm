; DESCRIPTION: Places a yellow line segment connecting (7, 148) to (264, 76).
; PLAN: r0=7(x1), r1=148(y1), r2=264(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 148
LDI r2, 264
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
