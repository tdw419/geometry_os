; DESCRIPTION: Renders a blue line between points (407, 228) and (272, 122).
; PLAN: r0=407(x1), r1=228(y1), r2=272(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 228
LDI r2, 272
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
