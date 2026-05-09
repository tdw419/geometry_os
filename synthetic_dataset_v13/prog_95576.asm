; DESCRIPTION: Renders a white line between points (108, 33) and (419, 255).
; PLAN: r0=108(x1), r1=33(y1), r2=419(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 33
LDI r2, 419
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
