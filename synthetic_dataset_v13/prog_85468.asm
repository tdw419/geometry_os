; DESCRIPTION: Places a magenta line segment connecting (346, 122) to (5, 252).
; PLAN: r0=346(x1), r1=122(y1), r2=5(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 122
LDI r2, 5
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
