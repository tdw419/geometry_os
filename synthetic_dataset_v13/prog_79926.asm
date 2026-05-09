; DESCRIPTION: Places a magenta line segment connecting (495, 230) to (447, 176).
; PLAN: r0=495(x1), r1=230(y1), r2=447(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 230
LDI r2, 447
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
