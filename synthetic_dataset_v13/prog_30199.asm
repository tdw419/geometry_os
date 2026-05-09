; DESCRIPTION: Renders a white line between points (108, 141) and (348, 206).
; PLAN: r0=108(x1), r1=141(y1), r2=348(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 141
LDI r2, 348
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
