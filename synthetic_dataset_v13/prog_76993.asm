; DESCRIPTION: Places a blue line segment connecting (290, 165) to (80, 54).
; PLAN: r0=290(x1), r1=165(y1), r2=80(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 165
LDI r2, 80
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
