; DESCRIPTION: Renders a magenta line between points (111, 218) and (125, 114).
; PLAN: r0=111(x1), r1=218(y1), r2=125(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 218
LDI r2, 125
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
