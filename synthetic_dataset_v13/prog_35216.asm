; DESCRIPTION: Draws a white line from (133, 190) to (344, 84).
; PLAN: r0=133(x1), r1=190(y1), r2=344(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 190
LDI r2, 344
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
