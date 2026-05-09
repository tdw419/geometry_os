; DESCRIPTION: Renders a magenta line between points (501, 149) and (375, 207).
; PLAN: r0=501(x1), r1=149(y1), r2=375(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 149
LDI r2, 375
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
