; DESCRIPTION: Renders a magenta line between points (378, 45) and (168, 75).
; PLAN: r0=378(x1), r1=45(y1), r2=168(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 45
LDI r2, 168
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
