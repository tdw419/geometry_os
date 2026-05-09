; DESCRIPTION: Renders a magenta line between points (462, 185) and (430, 242).
; PLAN: r0=462(x1), r1=185(y1), r2=430(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 185
LDI r2, 430
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
