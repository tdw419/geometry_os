; DESCRIPTION: Draws a white line from (375, 2) to (172, 74).
; PLAN: r0=375(x1), r1=2(y1), r2=172(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 2
LDI r2, 172
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
