; DESCRIPTION: Renders a magenta line between points (302, 75) and (81, 255).
; PLAN: r0=302(x1), r1=75(y1), r2=81(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 75
LDI r2, 81
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
