; DESCRIPTION: Places a magenta line segment connecting (26, 80) to (340, 28).
; PLAN: r0=26(x1), r1=80(y1), r2=340(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 80
LDI r2, 340
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
