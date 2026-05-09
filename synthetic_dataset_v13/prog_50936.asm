; DESCRIPTION: Draws a white line from (25, 175) to (432, 254).
; PLAN: r0=25(x1), r1=175(y1), r2=432(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 175
LDI r2, 432
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
