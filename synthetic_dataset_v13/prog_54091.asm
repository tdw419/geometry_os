; DESCRIPTION: Places a green line segment connecting (133, 248) to (72, 144).
; PLAN: r0=133(x1), r1=248(y1), r2=72(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 248
LDI r2, 72
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
