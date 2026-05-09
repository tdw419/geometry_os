; DESCRIPTION: Renders a white line between points (278, 76) and (143, 98).
; PLAN: r0=278(x1), r1=76(y1), r2=143(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 76
LDI r2, 143
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
