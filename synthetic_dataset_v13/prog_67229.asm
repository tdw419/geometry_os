; DESCRIPTION: Places a magenta line segment connecting (346, 78) to (5, 163).
; PLAN: r0=346(x1), r1=78(y1), r2=5(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 78
LDI r2, 5
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
