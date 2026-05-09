; DESCRIPTION: Draws a white line from (179, 174) to (88, 254).
; PLAN: r0=179(x1), r1=174(y1), r2=88(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 174
LDI r2, 88
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
