; DESCRIPTION: Renders a magenta line between points (487, 8) and (430, 78).
; PLAN: r0=487(x1), r1=8(y1), r2=430(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 8
LDI r2, 430
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
