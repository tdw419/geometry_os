; DESCRIPTION: Renders a white line between points (172, 14) and (317, 135).
; PLAN: r0=172(x1), r1=14(y1), r2=317(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 14
LDI r2, 317
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
