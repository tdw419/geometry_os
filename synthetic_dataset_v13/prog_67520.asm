; DESCRIPTION: Renders a white line between points (163, 77) and (280, 163).
; PLAN: r0=163(x1), r1=77(y1), r2=280(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 77
LDI r2, 280
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
