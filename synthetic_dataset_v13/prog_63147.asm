; DESCRIPTION: Draws a white line from (396, 252) to (16, 100).
; PLAN: r0=396(x1), r1=252(y1), r2=16(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 252
LDI r2, 16
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
