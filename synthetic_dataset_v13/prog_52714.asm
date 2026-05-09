; DESCRIPTION: Places a yellow line segment connecting (198, 132) to (396, 37).
; PLAN: r0=198(x1), r1=132(y1), r2=396(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 132
LDI r2, 396
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
