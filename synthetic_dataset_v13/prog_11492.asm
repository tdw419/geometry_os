; DESCRIPTION: Places a magenta line segment connecting (338, 7) to (315, 220).
; PLAN: r0=338(x1), r1=7(y1), r2=315(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 7
LDI r2, 315
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
