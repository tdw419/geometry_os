; DESCRIPTION: Renders a red line between points (289, 32) and (157, 145).
; PLAN: r0=289(x1), r1=32(y1), r2=157(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 32
LDI r2, 157
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
