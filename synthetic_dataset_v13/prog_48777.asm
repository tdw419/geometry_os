; DESCRIPTION: Renders a white line between points (436, 57) and (184, 120).
; PLAN: r0=436(x1), r1=57(y1), r2=184(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 57
LDI r2, 184
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
