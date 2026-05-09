; DESCRIPTION: Places a yellow line segment connecting (153, 134) to (4, 160).
; PLAN: r0=153(x1), r1=134(y1), r2=4(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 134
LDI r2, 4
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
