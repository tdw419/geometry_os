; DESCRIPTION: Renders a white line between points (397, 71) and (315, 255).
; PLAN: r0=397(x1), r1=71(y1), r2=315(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 71
LDI r2, 315
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
