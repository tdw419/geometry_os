; DESCRIPTION: Draws a black line from (354, 96) to (53, 241).
; PLAN: r0=354(x1), r1=96(y1), r2=53(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 96
LDI r2, 53
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
