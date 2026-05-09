; DESCRIPTION: Renders a white line between points (283, 179) and (436, 135).
; PLAN: r0=283(x1), r1=179(y1), r2=436(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 179
LDI r2, 436
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
