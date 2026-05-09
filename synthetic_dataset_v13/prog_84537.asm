; DESCRIPTION: Places a blue line segment connecting (285, 23) to (263, 91).
; PLAN: r0=285(x1), r1=23(y1), r2=263(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 23
LDI r2, 263
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
