; DESCRIPTION: Draws a white line from (476, 252) to (266, 108).
; PLAN: r0=476(x1), r1=252(y1), r2=266(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 252
LDI r2, 266
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
