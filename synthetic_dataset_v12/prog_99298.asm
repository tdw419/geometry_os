; DESCRIPTION: Places a purple line segment connecting (420, 46) to (164, 59).
; PLAN: r0=420(x1), r1=46(y1), r2=164(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 46
LDI r2, 164
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
