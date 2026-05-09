; DESCRIPTION: Places a yellow line segment connecting (303, 183) to (66, 218).
; PLAN: r0=303(x1), r1=183(y1), r2=66(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 183
LDI r2, 66
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
