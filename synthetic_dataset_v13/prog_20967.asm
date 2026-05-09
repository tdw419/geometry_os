; DESCRIPTION: Draws a black line from (61, 251) to (339, 64).
; PLAN: r0=61(x1), r1=251(y1), r2=339(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 251
LDI r2, 339
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
