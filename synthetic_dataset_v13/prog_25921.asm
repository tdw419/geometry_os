; DESCRIPTION: Renders a white line between points (478, 116) and (203, 28).
; PLAN: r0=478(x1), r1=116(y1), r2=203(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 116
LDI r2, 203
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
