; DESCRIPTION: Draws a red line from (452, 86) to (344, 18).
; PLAN: r0=452(x1), r1=86(y1), r2=344(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 86
LDI r2, 344
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
