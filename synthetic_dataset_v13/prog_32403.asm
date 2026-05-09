; DESCRIPTION: Renders a green line between points (3, 246) and (276, 244).
; PLAN: r0=3(x1), r1=246(y1), r2=276(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 246
LDI r2, 276
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
