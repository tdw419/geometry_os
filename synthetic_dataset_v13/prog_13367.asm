; DESCRIPTION: Renders a white line between points (358, 122) and (413, 11).
; PLAN: r0=358(x1), r1=122(y1), r2=413(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 122
LDI r2, 413
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
