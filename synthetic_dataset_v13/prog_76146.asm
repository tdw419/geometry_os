; DESCRIPTION: Draws a cyan line from (246, 138) to (344, 190).
; PLAN: r0=246(x1), r1=138(y1), r2=344(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 138
LDI r2, 344
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
