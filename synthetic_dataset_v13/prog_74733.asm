; DESCRIPTION: Renders a red line between points (346, 87) and (157, 97).
; PLAN: r0=346(x1), r1=87(y1), r2=157(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 87
LDI r2, 157
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
