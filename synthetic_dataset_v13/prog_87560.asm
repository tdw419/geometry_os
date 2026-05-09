; DESCRIPTION: Draws a white line from (476, 54) to (236, 8).
; PLAN: r0=476(x1), r1=54(y1), r2=236(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 54
LDI r2, 236
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
