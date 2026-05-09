; DESCRIPTION: Renders a white line between points (299, 92) and (3, 244).
; PLAN: r0=299(x1), r1=92(y1), r2=3(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 92
LDI r2, 3
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
