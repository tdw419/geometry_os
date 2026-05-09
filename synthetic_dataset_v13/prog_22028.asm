; DESCRIPTION: Places a yellow line segment connecting (126, 94) to (244, 25).
; PLAN: r0=126(x1), r1=94(y1), r2=244(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 94
LDI r2, 244
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
