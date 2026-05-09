; DESCRIPTION: Places a magenta line segment connecting (130, 134) to (303, 37).
; PLAN: r0=130(x1), r1=134(y1), r2=303(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 134
LDI r2, 303
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
