; DESCRIPTION: Draws a green line from (476, 248) to (266, 228).
; PLAN: r0=476(x1), r1=248(y1), r2=266(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 248
LDI r2, 266
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
