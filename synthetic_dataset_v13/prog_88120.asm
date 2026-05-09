; DESCRIPTION: Places a yellow line segment connecting (130, 59) to (145, 25).
; PLAN: r0=130(x1), r1=59(y1), r2=145(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 59
LDI r2, 145
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
