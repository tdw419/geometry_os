; DESCRIPTION: Renders a green line between points (178, 66) and (376, 22).
; PLAN: r0=178(x1), r1=66(y1), r2=376(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 66
LDI r2, 376
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
