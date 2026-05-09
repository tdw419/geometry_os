; DESCRIPTION: Renders a cyan line between points (316, 170) and (308, 51).
; PLAN: r0=316(x1), r1=170(y1), r2=308(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 170
LDI r2, 308
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
