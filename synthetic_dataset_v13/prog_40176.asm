; DESCRIPTION: Places a magenta line segment connecting (142, 164) to (303, 122).
; PLAN: r0=142(x1), r1=164(y1), r2=303(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 164
LDI r2, 303
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
