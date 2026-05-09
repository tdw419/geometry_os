; DESCRIPTION: Places a magenta line segment connecting (256, 57) to (310, 203).
; PLAN: r0=256(x1), r1=57(y1), r2=310(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 57
LDI r2, 310
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
