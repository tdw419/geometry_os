; DESCRIPTION: Renders a magenta line between points (375, 127) and (8, 137).
; PLAN: r0=375(x1), r1=127(y1), r2=8(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 127
LDI r2, 8
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
