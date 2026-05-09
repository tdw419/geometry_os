; DESCRIPTION: Renders a white line between points (373, 7) and (53, 61).
; PLAN: r0=373(x1), r1=7(y1), r2=53(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 7
LDI r2, 53
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
