; DESCRIPTION: Places a yellow line segment connecting (491, 68) to (326, 38).
; PLAN: r0=491(x1), r1=68(y1), r2=326(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 68
LDI r2, 326
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
