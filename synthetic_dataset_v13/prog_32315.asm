; DESCRIPTION: Renders a magenta line between points (272, 246) and (12, 184).
; PLAN: r0=272(x1), r1=246(y1), r2=12(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 246
LDI r2, 12
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
