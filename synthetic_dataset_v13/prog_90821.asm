; DESCRIPTION: Places a green line segment connecting (468, 43) to (506, 86).
; PLAN: r0=468(x1), r1=43(y1), r2=506(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 43
LDI r2, 506
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
