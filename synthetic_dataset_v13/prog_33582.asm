; DESCRIPTION: Places a yellow line segment connecting (117, 132) to (107, 31).
; PLAN: r0=117(x1), r1=132(y1), r2=107(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 132
LDI r2, 107
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
