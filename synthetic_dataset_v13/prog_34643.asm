; DESCRIPTION: Renders a white line between points (436, 73) and (80, 31).
; PLAN: r0=436(x1), r1=73(y1), r2=80(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 73
LDI r2, 80
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
