; DESCRIPTION: Renders a white line between points (203, 18) and (436, 241).
; PLAN: r0=203(x1), r1=18(y1), r2=436(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 18
LDI r2, 436
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
