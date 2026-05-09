; DESCRIPTION: Renders a white line between points (336, 21) and (441, 163).
; PLAN: r0=336(x1), r1=21(y1), r2=441(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 21
LDI r2, 441
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
