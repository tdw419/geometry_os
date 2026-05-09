; DESCRIPTION: Places a magenta line segment connecting (28, 139) to (225, 203).
; PLAN: r0=28(x1), r1=139(y1), r2=225(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 139
LDI r2, 225
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
