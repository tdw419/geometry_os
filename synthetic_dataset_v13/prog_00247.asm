; DESCRIPTION: Renders a magenta line between points (87, 77) and (393, 140).
; PLAN: r0=87(x1), r1=77(y1), r2=393(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 77
LDI r2, 393
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
