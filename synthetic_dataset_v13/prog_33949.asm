; DESCRIPTION: Renders a magenta line between points (224, 101) and (272, 106).
; PLAN: r0=224(x1), r1=101(y1), r2=272(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 101
LDI r2, 272
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
