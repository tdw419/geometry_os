; DESCRIPTION: Draws a white line from (508, 232) to (244, 148).
; PLAN: r0=508(x1), r1=232(y1), r2=244(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 232
LDI r2, 244
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
