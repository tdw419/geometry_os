; DESCRIPTION: Places a magenta line segment connecting (453, 242) to (190, 26).
; PLAN: r0=453(x1), r1=242(y1), r2=190(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 242
LDI r2, 190
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
