; DESCRIPTION: Renders a green line between points (128, 174) and (457, 119).
; PLAN: r0=128(x1), r1=174(y1), r2=457(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 174
LDI r2, 457
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
