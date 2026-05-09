; DESCRIPTION: Places a purple line segment connecting (509, 44) to (496, 28).
; PLAN: r0=509(x1), r1=44(y1), r2=496(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 44
LDI r2, 496
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
