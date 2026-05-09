; DESCRIPTION: Places a yellow line segment connecting (264, 37) to (99, 39).
; PLAN: r0=264(x1), r1=37(y1), r2=99(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 37
LDI r2, 99
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
