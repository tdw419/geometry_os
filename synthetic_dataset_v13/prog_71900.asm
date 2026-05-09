; DESCRIPTION: Renders a magenta line between points (210, 87) and (273, 1).
; PLAN: r0=210(x1), r1=87(y1), r2=273(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 87
LDI r2, 273
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
