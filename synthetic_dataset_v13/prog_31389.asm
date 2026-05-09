; DESCRIPTION: Places a magenta line segment connecting (221, 207) to (351, 83).
; PLAN: r0=221(x1), r1=207(y1), r2=351(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 207
LDI r2, 351
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
