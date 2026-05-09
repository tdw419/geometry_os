; DESCRIPTION: Draws a cyan line from (246, 158) to (447, 78).
; PLAN: r0=246(x1), r1=158(y1), r2=447(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 158
LDI r2, 447
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
