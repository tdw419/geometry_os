; DESCRIPTION: Renders a magenta line between points (3, 8) and (210, 140).
; PLAN: r0=3(x1), r1=8(y1), r2=210(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 8
LDI r2, 210
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
