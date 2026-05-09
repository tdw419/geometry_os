; DESCRIPTION: Places a purple line segment connecting (469, 204) to (275, 231).
; PLAN: r0=469(x1), r1=204(y1), r2=275(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 204
LDI r2, 275
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
