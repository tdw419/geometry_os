; DESCRIPTION: Renders a white line between points (199, 35) and (425, 157).
; PLAN: r0=199(x1), r1=35(y1), r2=425(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 35
LDI r2, 425
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
