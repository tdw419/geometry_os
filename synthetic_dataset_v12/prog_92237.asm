; DESCRIPTION: Places a magenta line segment connecting (375, 130) to (117, 118).
; PLAN: r0=375(x1), r1=130(y1), r2=117(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 130
LDI r2, 117
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
