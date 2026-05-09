; DESCRIPTION: Renders a green line between points (272, 80) and (453, 79).
; PLAN: r0=272(x1), r1=80(y1), r2=453(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 80
LDI r2, 453
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
