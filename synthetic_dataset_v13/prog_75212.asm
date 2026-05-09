; DESCRIPTION: Places a blue line segment connecting (496, 128) to (410, 206).
; PLAN: r0=496(x1), r1=128(y1), r2=410(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 128
LDI r2, 410
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
