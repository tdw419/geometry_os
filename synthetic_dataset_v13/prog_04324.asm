; DESCRIPTION: Places a yellow line segment connecting (346, 10) to (484, 5).
; PLAN: r0=346(x1), r1=10(y1), r2=484(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 10
LDI r2, 484
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
