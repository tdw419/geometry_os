; DESCRIPTION: Draws a black line from (282, 109) to (494, 67).
; PLAN: r0=282(x1), r1=109(y1), r2=494(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 109
LDI r2, 494
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
