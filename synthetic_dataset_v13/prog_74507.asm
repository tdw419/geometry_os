; DESCRIPTION: Renders a orange line between points (247, 64) and (236, 4).
; PLAN: r0=247(x1), r1=64(y1), r2=236(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 64
LDI r2, 236
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
