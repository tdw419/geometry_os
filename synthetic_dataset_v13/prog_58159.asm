; DESCRIPTION: Renders a white line between points (214, 31) and (199, 3).
; PLAN: r0=214(x1), r1=31(y1), r2=199(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 31
LDI r2, 199
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
