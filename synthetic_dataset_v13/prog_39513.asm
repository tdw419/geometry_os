; DESCRIPTION: Places a magenta line segment connecting (105, 94) to (346, 36).
; PLAN: r0=105(x1), r1=94(y1), r2=346(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 94
LDI r2, 346
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
