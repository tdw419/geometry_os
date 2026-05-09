; DESCRIPTION: Renders a magenta line between points (353, 242) and (72, 110).
; PLAN: r0=353(x1), r1=242(y1), r2=72(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 242
LDI r2, 72
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
