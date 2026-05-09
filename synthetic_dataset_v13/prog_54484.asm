; DESCRIPTION: Renders a magenta line between points (170, 79) and (406, 32).
; PLAN: r0=170(x1), r1=79(y1), r2=406(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 79
LDI r2, 406
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
