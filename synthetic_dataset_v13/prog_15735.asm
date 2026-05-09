; DESCRIPTION: Renders a magenta line between points (73, 117) and (431, 104).
; PLAN: r0=73(x1), r1=117(y1), r2=431(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 117
LDI r2, 431
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
