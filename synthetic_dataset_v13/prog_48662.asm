; DESCRIPTION: Places a magenta line segment connecting (499, 87) to (261, 88).
; PLAN: r0=499(x1), r1=87(y1), r2=261(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 87
LDI r2, 261
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
