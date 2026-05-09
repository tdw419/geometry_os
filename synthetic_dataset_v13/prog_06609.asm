; DESCRIPTION: Renders a white line between points (421, 29) and (111, 217).
; PLAN: r0=421(x1), r1=29(y1), r2=111(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 29
LDI r2, 111
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
