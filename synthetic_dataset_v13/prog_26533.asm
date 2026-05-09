; DESCRIPTION: Places a magenta line segment connecting (242, 137) to (98, 122).
; PLAN: r0=242(x1), r1=137(y1), r2=98(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 137
LDI r2, 98
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
