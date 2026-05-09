; DESCRIPTION: Renders a cyan line between points (469, 88) and (316, 81).
; PLAN: r0=469(x1), r1=88(y1), r2=316(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 88
LDI r2, 316
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
