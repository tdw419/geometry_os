; DESCRIPTION: Draws a white line from (244, 166) to (40, 74).
; PLAN: r0=244(x1), r1=166(y1), r2=40(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 166
LDI r2, 40
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
