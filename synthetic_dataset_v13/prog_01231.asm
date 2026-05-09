; DESCRIPTION: Places a blue line segment connecting (273, 107) to (245, 97).
; PLAN: r0=273(x1), r1=107(y1), r2=245(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 107
LDI r2, 245
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
