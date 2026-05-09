; DESCRIPTION: Places a blue line segment connecting (277, 170) to (0, 239).
; PLAN: r0=277(x1), r1=170(y1), r2=0(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 170
LDI r2, 0
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
