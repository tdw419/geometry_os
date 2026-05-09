; DESCRIPTION: Renders a cyan line between points (368, 75) and (430, 214).
; PLAN: r0=368(x1), r1=75(y1), r2=430(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 75
LDI r2, 430
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
