; DESCRIPTION: Places a purple line segment connecting (366, 245) to (83, 228).
; PLAN: r0=366(x1), r1=245(y1), r2=83(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 245
LDI r2, 83
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
