; DESCRIPTION: Renders a magenta line between points (398, 125) and (357, 101).
; PLAN: r0=398(x1), r1=125(y1), r2=357(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 125
LDI r2, 357
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
