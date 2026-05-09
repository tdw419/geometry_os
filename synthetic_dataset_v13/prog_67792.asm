; DESCRIPTION: Draws a red line from (344, 114) to (339, 203).
; PLAN: r0=344(x1), r1=114(y1), r2=339(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 114
LDI r2, 339
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
