; DESCRIPTION: Renders a purple line between points (272, 144) and (23, 28).
; PLAN: r0=272(x1), r1=144(y1), r2=23(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 144
LDI r2, 23
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
