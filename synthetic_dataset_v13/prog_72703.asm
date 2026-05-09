; DESCRIPTION: Places a yellow line segment connecting (268, 200) to (326, 70).
; PLAN: r0=268(x1), r1=200(y1), r2=326(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 200
LDI r2, 326
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
