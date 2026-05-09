; DESCRIPTION: Places a magenta line segment connecting (65, 115) to (130, 242).
; PLAN: r0=65(x1), r1=115(y1), r2=130(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 115
LDI r2, 130
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
