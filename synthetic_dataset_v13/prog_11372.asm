; DESCRIPTION: Places a blue line segment connecting (239, 93) to (97, 163).
; PLAN: r0=239(x1), r1=93(y1), r2=97(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 93
LDI r2, 97
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
