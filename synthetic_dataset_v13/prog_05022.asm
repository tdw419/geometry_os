; DESCRIPTION: Places a magenta line segment connecting (351, 57) to (509, 122).
; PLAN: r0=351(x1), r1=57(y1), r2=509(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 57
LDI r2, 509
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
