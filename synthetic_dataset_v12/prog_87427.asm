; DESCRIPTION: Places a green line segment connecting (105, 14) to (81, 118).
; PLAN: r0=105(x1), r1=14(y1), r2=81(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 14
LDI r2, 81
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
