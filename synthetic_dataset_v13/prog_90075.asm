; DESCRIPTION: Places a magenta line segment connecting (382, 128) to (139, 84).
; PLAN: r0=382(x1), r1=128(y1), r2=139(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 128
LDI r2, 139
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
