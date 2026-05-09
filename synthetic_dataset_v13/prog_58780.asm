; DESCRIPTION: Renders a red line between points (318, 41) and (370, 255).
; PLAN: r0=318(x1), r1=41(y1), r2=370(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 41
LDI r2, 370
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
