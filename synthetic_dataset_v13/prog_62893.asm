; DESCRIPTION: Draws a white line from (461, 24) to (344, 128).
; PLAN: r0=461(x1), r1=24(y1), r2=344(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 24
LDI r2, 344
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
