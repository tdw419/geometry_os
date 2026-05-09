; DESCRIPTION: Places a green line segment connecting (307, 9) to (373, 56).
; PLAN: r0=307(x1), r1=9(y1), r2=373(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 9
LDI r2, 373
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
