; DESCRIPTION: Places a yellow line segment connecting (435, 103) to (249, 84).
; PLAN: r0=435(x1), r1=103(y1), r2=249(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 103
LDI r2, 249
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
