; DESCRIPTION: Renders a white line between points (252, 89) and (117, 246).
; PLAN: r0=252(x1), r1=89(y1), r2=117(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 89
LDI r2, 117
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
