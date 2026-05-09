; DESCRIPTION: Draws a cyan line from (476, 148) to (276, 233).
; PLAN: r0=476(x1), r1=148(y1), r2=276(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 148
LDI r2, 276
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
