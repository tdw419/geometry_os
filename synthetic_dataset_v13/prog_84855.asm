; DESCRIPTION: Places a white line segment connecting (392, 245) to (97, 191).
; PLAN: r0=392(x1), r1=245(y1), r2=97(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 245
LDI r2, 97
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
