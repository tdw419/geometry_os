; DESCRIPTION: Draws a white line from (476, 206) to (183, 23).
; PLAN: r0=476(x1), r1=206(y1), r2=183(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 206
LDI r2, 183
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
