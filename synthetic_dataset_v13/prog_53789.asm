; DESCRIPTION: Draws a green line from (173, 14) to (49, 158).
; PLAN: r0=173(x1), r1=14(y1), r2=49(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 14
LDI r2, 49
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
