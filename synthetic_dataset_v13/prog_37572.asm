; DESCRIPTION: Renders a green line between points (171, 55) and (316, 233).
; PLAN: r0=171(x1), r1=55(y1), r2=316(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 55
LDI r2, 316
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
