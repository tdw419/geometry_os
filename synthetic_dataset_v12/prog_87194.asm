; DESCRIPTION: Places a yellow line segment connecting (423, 76) to (135, 48).
; PLAN: r0=423(x1), r1=76(y1), r2=135(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 76
LDI r2, 135
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
