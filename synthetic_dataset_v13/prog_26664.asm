; DESCRIPTION: Places a yellow line segment connecting (178, 9) to (80, 39).
; PLAN: r0=178(x1), r1=9(y1), r2=80(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 9
LDI r2, 80
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
