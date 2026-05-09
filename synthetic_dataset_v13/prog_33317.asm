; DESCRIPTION: Renders a magenta line between points (125, 108) and (162, 86).
; PLAN: r0=125(x1), r1=108(y1), r2=162(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 108
LDI r2, 162
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
