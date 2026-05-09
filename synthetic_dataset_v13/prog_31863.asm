; DESCRIPTION: Places a magenta line segment connecting (233, 203) to (107, 242).
; PLAN: r0=233(x1), r1=203(y1), r2=107(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 203
LDI r2, 107
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
