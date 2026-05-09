; DESCRIPTION: Places a yellow line segment connecting (302, 77) to (179, 134).
; PLAN: r0=302(x1), r1=77(y1), r2=179(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 77
LDI r2, 179
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
