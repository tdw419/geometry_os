; DESCRIPTION: Places a yellow line segment connecting (181, 13) to (151, 166).
; PLAN: r0=181(x1), r1=13(y1), r2=151(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 13
LDI r2, 151
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
