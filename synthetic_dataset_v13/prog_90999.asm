; DESCRIPTION: Renders a white line between points (172, 206) and (413, 100).
; PLAN: r0=172(x1), r1=206(y1), r2=413(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 206
LDI r2, 413
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
