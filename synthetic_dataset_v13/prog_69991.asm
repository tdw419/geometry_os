; DESCRIPTION: Renders a white line between points (56, 28) and (240, 102).
; PLAN: r0=56(x1), r1=28(y1), r2=240(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 28
LDI r2, 240
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
