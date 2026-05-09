; DESCRIPTION: Places a blue line segment connecting (373, 99) to (295, 67).
; PLAN: r0=373(x1), r1=99(y1), r2=295(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 99
LDI r2, 295
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
