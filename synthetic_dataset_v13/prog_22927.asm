; DESCRIPTION: Places a magenta line segment connecting (378, 35) to (198, 206).
; PLAN: r0=378(x1), r1=35(y1), r2=198(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 35
LDI r2, 198
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
