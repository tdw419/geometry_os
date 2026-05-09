; DESCRIPTION: Places a blue line segment connecting (117, 223) to (128, 58).
; PLAN: r0=117(x1), r1=223(y1), r2=128(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 223
LDI r2, 128
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
