; DESCRIPTION: Renders a magenta line between points (218, 4) and (156, 181).
; PLAN: r0=218(x1), r1=4(y1), r2=156(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 4
LDI r2, 156
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
