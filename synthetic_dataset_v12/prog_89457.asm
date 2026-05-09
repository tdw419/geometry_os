; DESCRIPTION: Places a yellow line segment connecting (303, 109) to (226, 18).
; PLAN: r0=303(x1), r1=109(y1), r2=226(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 109
LDI r2, 226
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
