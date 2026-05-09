; DESCRIPTION: Renders a white line between points (419, 92) and (255, 255).
; PLAN: r0=419(x1), r1=92(y1), r2=255(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 92
LDI r2, 255
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
