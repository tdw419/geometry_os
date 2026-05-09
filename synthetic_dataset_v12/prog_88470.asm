; DESCRIPTION: Renders a magenta line between points (272, 240) and (57, 106).
; PLAN: r0=272(x1), r1=240(y1), r2=57(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 240
LDI r2, 57
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
