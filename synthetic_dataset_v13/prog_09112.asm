; DESCRIPTION: Renders a yellow line between points (128, 19) and (508, 119).
; PLAN: r0=128(x1), r1=19(y1), r2=508(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 19
LDI r2, 508
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
