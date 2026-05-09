; DESCRIPTION: Draws a cyan line from (476, 167) to (318, 189).
; PLAN: r0=476(x1), r1=167(y1), r2=318(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 167
LDI r2, 318
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
