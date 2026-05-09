; DESCRIPTION: Renders a white line between points (130, 240) and (203, 184).
; PLAN: r0=130(x1), r1=240(y1), r2=203(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 240
LDI r2, 203
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
