; DESCRIPTION: Renders a magenta line between points (375, 30) and (170, 63).
; PLAN: r0=375(x1), r1=30(y1), r2=170(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 30
LDI r2, 170
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
