; DESCRIPTION: Renders a white line between points (151, 254) and (238, 77).
; PLAN: r0=151(x1), r1=254(y1), r2=238(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 254
LDI r2, 238
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
