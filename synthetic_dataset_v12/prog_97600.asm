; DESCRIPTION: Renders a purple line between points (308, 20) and (272, 56).
; PLAN: r0=308(x1), r1=20(y1), r2=272(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 20
LDI r2, 272
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
