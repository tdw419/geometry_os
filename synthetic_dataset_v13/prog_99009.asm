; DESCRIPTION: Renders a magenta line between points (417, 119) and (269, 82).
; PLAN: r0=417(x1), r1=119(y1), r2=269(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 119
LDI r2, 269
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
