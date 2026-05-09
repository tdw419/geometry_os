; DESCRIPTION: Places a green line segment connecting (181, 28) to (128, 28).
; PLAN: r0=181(x1), r1=28(y1), r2=128(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 28
LDI r2, 128
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
