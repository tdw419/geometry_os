; DESCRIPTION: Renders a green line between points (253, 58) and (276, 149).
; PLAN: r0=253(x1), r1=58(y1), r2=276(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 58
LDI r2, 276
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
