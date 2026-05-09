; DESCRIPTION: Renders a white line between points (436, 26) and (240, 71).
; PLAN: r0=436(x1), r1=26(y1), r2=240(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 26
LDI r2, 240
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
