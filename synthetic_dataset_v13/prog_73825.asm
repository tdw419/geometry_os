; DESCRIPTION: Places a yellow line segment connecting (308, 122) to (455, 243).
; PLAN: r0=308(x1), r1=122(y1), r2=455(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 122
LDI r2, 455
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
