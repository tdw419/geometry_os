; DESCRIPTION: Renders a orange line between points (346, 246) and (188, 31).
; PLAN: r0=346(x1), r1=246(y1), r2=188(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 246
LDI r2, 188
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
