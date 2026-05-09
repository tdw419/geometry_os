; DESCRIPTION: Places a purple line segment connecting (294, 23) to (135, 29).
; PLAN: r0=294(x1), r1=23(y1), r2=135(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 23
LDI r2, 135
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
