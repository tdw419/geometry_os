; DESCRIPTION: Renders a white line between points (274, 42) and (97, 133).
; PLAN: r0=274(x1), r1=42(y1), r2=97(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 42
LDI r2, 97
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
