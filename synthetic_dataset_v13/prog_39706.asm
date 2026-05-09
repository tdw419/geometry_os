; DESCRIPTION: Renders a red line between points (299, 252) and (261, 251).
; PLAN: r0=299(x1), r1=252(y1), r2=261(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 252
LDI r2, 261
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
