; DESCRIPTION: Places a yellow line segment connecting (183, 72) to (195, 84).
; PLAN: r0=183(x1), r1=72(y1), r2=195(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 72
LDI r2, 195
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
