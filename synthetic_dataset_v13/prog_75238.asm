; DESCRIPTION: Renders a magenta line between points (280, 106) and (166, 1).
; PLAN: r0=280(x1), r1=106(y1), r2=166(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 106
LDI r2, 166
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
