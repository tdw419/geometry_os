; DESCRIPTION: Renders a magenta line between points (244, 131) and (2, 56).
; PLAN: r0=244(x1), r1=131(y1), r2=2(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 131
LDI r2, 2
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
