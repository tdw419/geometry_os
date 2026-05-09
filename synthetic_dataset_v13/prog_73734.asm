; DESCRIPTION: Renders a white line between points (192, 72) and (67, 250).
; PLAN: r0=192(x1), r1=72(y1), r2=67(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 72
LDI r2, 67
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
