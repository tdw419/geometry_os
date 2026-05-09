; DESCRIPTION: Places a yellow line segment connecting (149, 126) to (493, 227).
; PLAN: r0=149(x1), r1=126(y1), r2=493(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 126
LDI r2, 493
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
