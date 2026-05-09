; DESCRIPTION: Renders a red line between points (276, 240) and (289, 40).
; PLAN: r0=276(x1), r1=240(y1), r2=289(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 240
LDI r2, 289
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
