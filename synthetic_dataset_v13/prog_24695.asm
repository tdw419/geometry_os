; DESCRIPTION: Places a yellow line segment connecting (20, 138) to (159, 68).
; PLAN: r0=20(x1), r1=138(y1), r2=159(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 138
LDI r2, 159
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
