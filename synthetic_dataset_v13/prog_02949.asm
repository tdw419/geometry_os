; DESCRIPTION: Draws a black line from (102, 32) to (494, 233).
; PLAN: r0=102(x1), r1=32(y1), r2=494(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 32
LDI r2, 494
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
