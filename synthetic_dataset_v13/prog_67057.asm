; DESCRIPTION: Draws a white line from (42, 192) to (476, 0).
; PLAN: r0=42(x1), r1=192(y1), r2=476(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 192
LDI r2, 476
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
