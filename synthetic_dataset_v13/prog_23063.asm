; DESCRIPTION: Renders a white line between points (12, 108) and (477, 153).
; PLAN: r0=12(x1), r1=108(y1), r2=477(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 108
LDI r2, 477
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
