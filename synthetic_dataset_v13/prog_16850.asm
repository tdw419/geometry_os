; DESCRIPTION: Places a green line segment connecting (351, 177) to (135, 67).
; PLAN: r0=351(x1), r1=177(y1), r2=135(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 177
LDI r2, 135
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
