; DESCRIPTION: Renders a white line between points (332, 21) and (475, 184).
; PLAN: r0=332(x1), r1=21(y1), r2=475(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 21
LDI r2, 475
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
