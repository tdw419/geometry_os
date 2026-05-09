; DESCRIPTION: Renders a red line between points (289, 212) and (353, 64).
; PLAN: r0=289(x1), r1=212(y1), r2=353(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 212
LDI r2, 353
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
