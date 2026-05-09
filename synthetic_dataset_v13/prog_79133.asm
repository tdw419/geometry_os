; DESCRIPTION: Renders a magenta line between points (29, 1) and (134, 91).
; PLAN: r0=29(x1), r1=1(y1), r2=134(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 1
LDI r2, 134
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
