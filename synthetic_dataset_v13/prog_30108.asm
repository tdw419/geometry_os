; DESCRIPTION: Renders a green line between points (509, 142) and (297, 189).
; PLAN: r0=509(x1), r1=142(y1), r2=297(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 142
LDI r2, 297
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
