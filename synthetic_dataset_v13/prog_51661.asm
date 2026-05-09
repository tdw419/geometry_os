; DESCRIPTION: Renders a black line between points (357, 150) and (323, 128).
; PLAN: r0=357(x1), r1=150(y1), r2=323(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 150
LDI r2, 323
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
