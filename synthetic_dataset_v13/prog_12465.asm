; DESCRIPTION: Places a yellow line segment connecting (277, 7) to (484, 93).
; PLAN: r0=277(x1), r1=7(y1), r2=484(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 7
LDI r2, 484
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
