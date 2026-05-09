; DESCRIPTION: Draws a black line from (452, 148) to (346, 81).
; PLAN: r0=452(x1), r1=148(y1), r2=346(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 148
LDI r2, 346
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
