; DESCRIPTION: Renders a magenta line between points (467, 194) and (272, 194).
; PLAN: r0=467(x1), r1=194(y1), r2=272(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 194
LDI r2, 272
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
