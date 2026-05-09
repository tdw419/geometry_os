; DESCRIPTION: Renders a white line between points (126, 157) and (62, 189).
; PLAN: r0=126(x1), r1=157(y1), r2=62(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 157
LDI r2, 62
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
