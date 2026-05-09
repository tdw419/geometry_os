; DESCRIPTION: Places a black line segment connecting (144, 9) to (191, 158).
; PLAN: r0=144(x1), r1=9(y1), r2=191(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 9
LDI r2, 191
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
