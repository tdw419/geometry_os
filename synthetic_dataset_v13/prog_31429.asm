; DESCRIPTION: Places a magenta line segment connecting (465, 170) to (453, 242).
; PLAN: r0=465(x1), r1=170(y1), r2=453(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 170
LDI r2, 453
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
