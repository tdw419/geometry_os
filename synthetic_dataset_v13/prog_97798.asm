; DESCRIPTION: Draws a black line from (491, 8) to (265, 53).
; PLAN: r0=491(x1), r1=8(y1), r2=265(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 8
LDI r2, 265
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
