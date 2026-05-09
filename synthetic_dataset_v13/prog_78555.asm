; DESCRIPTION: Draws a white line from (117, 250) to (476, 82).
; PLAN: r0=117(x1), r1=250(y1), r2=476(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 250
LDI r2, 476
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
