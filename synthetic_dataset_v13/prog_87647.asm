; DESCRIPTION: Draws a cyan line from (44, 241) to (316, 157).
; PLAN: r0=44(x1), r1=241(y1), r2=316(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 241
LDI r2, 316
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
