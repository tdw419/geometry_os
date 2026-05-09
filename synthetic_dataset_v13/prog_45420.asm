; DESCRIPTION: Renders a green line between points (413, 7) and (477, 189).
; PLAN: r0=413(x1), r1=7(y1), r2=477(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 7
LDI r2, 477
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
