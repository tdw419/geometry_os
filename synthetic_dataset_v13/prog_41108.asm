; DESCRIPTION: Places a green line segment connecting (500, 33) to (101, 86).
; PLAN: r0=500(x1), r1=33(y1), r2=101(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 33
LDI r2, 101
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
