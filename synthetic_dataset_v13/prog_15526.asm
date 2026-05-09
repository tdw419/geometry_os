; DESCRIPTION: Renders a white line between points (233, 255) and (24, 122).
; PLAN: r0=233(x1), r1=255(y1), r2=24(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 255
LDI r2, 24
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
