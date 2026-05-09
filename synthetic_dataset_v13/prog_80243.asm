; DESCRIPTION: Renders a white line between points (266, 38) and (250, 12).
; PLAN: r0=266(x1), r1=38(y1), r2=250(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 38
LDI r2, 250
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
