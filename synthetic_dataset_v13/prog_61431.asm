; DESCRIPTION: Draws a red line from (144, 228) to (339, 34).
; PLAN: r0=144(x1), r1=228(y1), r2=339(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 228
LDI r2, 339
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
