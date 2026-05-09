; DESCRIPTION: Renders a orange line between points (236, 25) and (361, 156).
; PLAN: r0=236(x1), r1=25(y1), r2=361(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 25
LDI r2, 361
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
