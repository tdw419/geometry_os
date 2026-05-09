; DESCRIPTION: Renders a magenta line between points (412, 125) and (86, 99).
; PLAN: r0=412(x1), r1=125(y1), r2=86(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 125
LDI r2, 86
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
