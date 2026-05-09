; DESCRIPTION: Places a black line segment connecting (63, 99) to (265, 158).
; PLAN: r0=63(x1), r1=99(y1), r2=265(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 265
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
