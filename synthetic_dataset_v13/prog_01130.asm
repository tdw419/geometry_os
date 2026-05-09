; DESCRIPTION: Places a white line segment connecting (452, 231) to (97, 87).
; PLAN: r0=452(x1), r1=231(y1), r2=97(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 231
LDI r2, 97
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
