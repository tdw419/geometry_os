; DESCRIPTION: Places a green line segment connecting (399, 149) to (259, 4).
; PLAN: r0=399(x1), r1=149(y1), r2=259(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 149
LDI r2, 259
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
