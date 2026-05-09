; DESCRIPTION: Places a blue line segment connecting (294, 5) to (58, 23).
; PLAN: r0=294(x1), r1=5(y1), r2=58(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 5
LDI r2, 58
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
