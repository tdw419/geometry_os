; DESCRIPTION: Draws a cyan line from (316, 236) to (474, 61).
; PLAN: r0=316(x1), r1=236(y1), r2=474(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 236
LDI r2, 474
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
