; DESCRIPTION: Renders a black line between points (100, 144) and (299, 252).
; PLAN: r0=100(x1), r1=144(y1), r2=299(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 144
LDI r2, 299
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
