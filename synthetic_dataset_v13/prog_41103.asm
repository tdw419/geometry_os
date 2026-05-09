; DESCRIPTION: Renders a yellow line between points (276, 87) and (8, 133).
; PLAN: r0=276(x1), r1=87(y1), r2=8(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 87
LDI r2, 8
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
