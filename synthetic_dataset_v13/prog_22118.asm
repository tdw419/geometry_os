; DESCRIPTION: Places a magenta line segment connecting (399, 203) to (300, 16).
; PLAN: r0=399(x1), r1=203(y1), r2=300(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 203
LDI r2, 300
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
