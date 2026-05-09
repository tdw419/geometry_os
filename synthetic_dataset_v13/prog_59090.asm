; DESCRIPTION: Places a green line segment connecting (505, 36) to (395, 103).
; PLAN: r0=505(x1), r1=36(y1), r2=395(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 36
LDI r2, 395
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
