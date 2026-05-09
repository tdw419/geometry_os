; DESCRIPTION: Places a magenta line segment connecting (426, 15) to (144, 203).
; PLAN: r0=426(x1), r1=15(y1), r2=144(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 15
LDI r2, 144
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
