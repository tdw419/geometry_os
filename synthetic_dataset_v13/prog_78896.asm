; DESCRIPTION: Renders a magenta line between points (444, 125) and (141, 39).
; PLAN: r0=444(x1), r1=125(y1), r2=141(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 125
LDI r2, 141
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
