; DESCRIPTION: Renders a magenta line between points (417, 0) and (167, 93).
; PLAN: r0=417(x1), r1=0(y1), r2=167(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 0
LDI r2, 167
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
