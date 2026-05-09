; DESCRIPTION: Draws a white line from (227, 109) to (396, 24).
; PLAN: r0=227(x1), r1=109(y1), r2=396(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 109
LDI r2, 396
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
