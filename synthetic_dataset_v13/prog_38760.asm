; DESCRIPTION: Places a magenta line segment connecting (20, 82) to (375, 140).
; PLAN: r0=20(x1), r1=82(y1), r2=375(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 82
LDI r2, 375
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
