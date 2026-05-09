; DESCRIPTION: Draws a white line from (476, 202) to (489, 28).
; PLAN: r0=476(x1), r1=202(y1), r2=489(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 202
LDI r2, 489
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
