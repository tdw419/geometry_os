; DESCRIPTION: Renders a orange line between points (347, 250) and (64, 156).
; PLAN: r0=347(x1), r1=250(y1), r2=64(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 250
LDI r2, 64
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
