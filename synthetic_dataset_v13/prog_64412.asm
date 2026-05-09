; DESCRIPTION: Renders a magenta line between points (9, 163) and (417, 195).
; PLAN: r0=9(x1), r1=163(y1), r2=417(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 163
LDI r2, 417
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
