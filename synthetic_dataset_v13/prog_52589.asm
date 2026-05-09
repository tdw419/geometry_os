; DESCRIPTION: Places a green line segment connecting (20, 28) to (99, 54).
; PLAN: r0=20(x1), r1=28(y1), r2=99(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 28
LDI r2, 99
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
