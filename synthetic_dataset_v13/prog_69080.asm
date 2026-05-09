; DESCRIPTION: Draws a cyan line from (316, 24) to (316, 114).
; PLAN: r0=316(x1), r1=24(y1), r2=316(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 24
LDI r2, 316
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
