; DESCRIPTION: Draws a cyan line from (472, 15) to (246, 104).
; PLAN: r0=472(x1), r1=15(y1), r2=246(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 15
LDI r2, 246
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
