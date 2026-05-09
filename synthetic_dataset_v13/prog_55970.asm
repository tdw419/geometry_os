; DESCRIPTION: Draws a cyan line from (165, 43) to (344, 203).
; PLAN: r0=165(x1), r1=43(y1), r2=344(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 43
LDI r2, 344
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
