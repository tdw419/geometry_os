; DESCRIPTION: Renders a magenta line between points (326, 75) and (393, 130).
; PLAN: r0=326(x1), r1=75(y1), r2=393(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 75
LDI r2, 393
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
