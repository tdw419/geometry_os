; DESCRIPTION: Renders a white line between points (407, 28) and (159, 59).
; PLAN: r0=407(x1), r1=28(y1), r2=159(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 28
LDI r2, 159
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
