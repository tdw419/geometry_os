; DESCRIPTION: Renders a white line between points (178, 57) and (458, 82).
; PLAN: r0=178(x1), r1=57(y1), r2=458(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 57
LDI r2, 458
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
