; DESCRIPTION: Draws a cyan line from (472, 39) to (476, 102).
; PLAN: r0=472(x1), r1=39(y1), r2=476(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 39
LDI r2, 476
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
