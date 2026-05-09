; DESCRIPTION: Places a magenta line segment connecting (253, 2) to (70, 242).
; PLAN: r0=253(x1), r1=2(y1), r2=70(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 2
LDI r2, 70
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
