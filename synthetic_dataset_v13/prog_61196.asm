; DESCRIPTION: Places a blue line segment connecting (370, 58) to (304, 128).
; PLAN: r0=370(x1), r1=58(y1), r2=304(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 58
LDI r2, 304
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
