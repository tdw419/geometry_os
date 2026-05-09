; DESCRIPTION: Renders a magenta line between points (264, 37) and (272, 137).
; PLAN: r0=264(x1), r1=37(y1), r2=272(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 37
LDI r2, 272
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
