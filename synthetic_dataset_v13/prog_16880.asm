; DESCRIPTION: Renders a magenta line between points (100, 250) and (340, 89).
; PLAN: r0=100(x1), r1=250(y1), r2=340(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 250
LDI r2, 340
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
