; DESCRIPTION: Places a white line segment connecting (441, 188) to (469, 206).
; PLAN: r0=441(x1), r1=188(y1), r2=469(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 188
LDI r2, 469
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
