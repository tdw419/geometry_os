; DESCRIPTION: Draws a white line from (232, 9) to (16, 101).
; PLAN: r0=232(x1), r1=9(y1), r2=16(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 9
LDI r2, 16
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
