; DESCRIPTION: Places a purple line segment connecting (227, 59) to (33, 113).
; PLAN: r0=227(x1), r1=59(y1), r2=33(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 59
LDI r2, 33
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
