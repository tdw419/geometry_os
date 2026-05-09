; DESCRIPTION: Places a yellow line segment connecting (72, 60) to (35, 173).
; PLAN: r0=72(x1), r1=60(y1), r2=35(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 60
LDI r2, 35
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
