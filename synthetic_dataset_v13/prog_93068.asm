; DESCRIPTION: Draws a white line from (31, 143) to (206, 74).
; PLAN: r0=31(x1), r1=143(y1), r2=206(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 143
LDI r2, 206
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
