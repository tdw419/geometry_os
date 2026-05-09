; DESCRIPTION: Renders a red line between points (430, 7) and (123, 170).
; PLAN: r0=430(x1), r1=7(y1), r2=123(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 7
LDI r2, 123
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
