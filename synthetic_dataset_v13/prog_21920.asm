; DESCRIPTION: Places a green line segment connecting (11, 175) to (151, 196).
; PLAN: r0=11(x1), r1=175(y1), r2=151(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 175
LDI r2, 151
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
