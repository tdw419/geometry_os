; DESCRIPTION: Draws a cyan line from (100, 81) to (316, 225).
; PLAN: r0=100(x1), r1=81(y1), r2=316(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 81
LDI r2, 316
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
