; DESCRIPTION: Renders a red line between points (370, 79) and (139, 249).
; PLAN: r0=370(x1), r1=79(y1), r2=139(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 79
LDI r2, 139
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
