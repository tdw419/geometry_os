; DESCRIPTION: Renders a magenta line between points (468, 210) and (125, 79).
; PLAN: r0=468(x1), r1=210(y1), r2=125(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 210
LDI r2, 125
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
