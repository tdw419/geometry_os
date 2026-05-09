; DESCRIPTION: Renders a magenta line between points (159, 18) and (152, 6).
; PLAN: r0=159(x1), r1=18(y1), r2=152(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 18
LDI r2, 152
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
