; DESCRIPTION: Places a blue line segment connecting (171, 99) to (203, 13).
; PLAN: r0=171(x1), r1=99(y1), r2=203(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 99
LDI r2, 203
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
