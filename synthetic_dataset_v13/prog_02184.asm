; DESCRIPTION: Places a blue line segment connecting (400, 234) to (290, 7).
; PLAN: r0=400(x1), r1=234(y1), r2=290(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 234
LDI r2, 290
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
