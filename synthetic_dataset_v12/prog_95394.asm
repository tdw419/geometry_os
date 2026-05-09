; DESCRIPTION: Draws a white line from (72, 125) to (139, 155).
; PLAN: r0=72(x1), r1=125(y1), r2=139(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 125
LDI r2, 139
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
