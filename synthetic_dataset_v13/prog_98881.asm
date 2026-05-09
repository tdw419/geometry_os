; DESCRIPTION: Draws a white line from (396, 104) to (181, 83).
; PLAN: r0=396(x1), r1=104(y1), r2=181(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 104
LDI r2, 181
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
