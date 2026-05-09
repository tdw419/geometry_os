; DESCRIPTION: Draws a green line from (484, 143) to (20, 212).
; PLAN: r0=484(x1), r1=143(y1), r2=20(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 143
LDI r2, 20
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
