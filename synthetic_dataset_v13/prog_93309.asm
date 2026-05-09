; DESCRIPTION: Places a yellow line segment connecting (427, 143) to (28, 86).
; PLAN: r0=427(x1), r1=143(y1), r2=28(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 143
LDI r2, 28
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
