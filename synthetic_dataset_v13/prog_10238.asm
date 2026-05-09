; DESCRIPTION: Renders a magenta line between points (350, 181) and (286, 194).
; PLAN: r0=350(x1), r1=181(y1), r2=286(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 181
LDI r2, 286
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
