; DESCRIPTION: Places a green line segment connecting (118, 13) to (261, 196).
; PLAN: r0=118(x1), r1=13(y1), r2=261(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 13
LDI r2, 261
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
