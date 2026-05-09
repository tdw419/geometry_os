; DESCRIPTION: Places a black line segment connecting (122, 253) to (156, 127).
; PLAN: r0=122(x1), r1=253(y1), r2=156(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 253
LDI r2, 156
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
