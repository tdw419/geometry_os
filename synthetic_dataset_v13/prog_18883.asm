; DESCRIPTION: Renders a white line between points (354, 233) and (62, 251).
; PLAN: r0=354(x1), r1=233(y1), r2=62(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 233
LDI r2, 62
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
