; DESCRIPTION: Renders a magenta line between points (347, 179) and (60, 63).
; PLAN: r0=347(x1), r1=179(y1), r2=60(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 179
LDI r2, 60
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
