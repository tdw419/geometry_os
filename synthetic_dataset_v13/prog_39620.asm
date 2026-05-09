; DESCRIPTION: Places a green line segment connecting (145, 91) to (264, 10).
; PLAN: r0=145(x1), r1=91(y1), r2=264(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 91
LDI r2, 264
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
