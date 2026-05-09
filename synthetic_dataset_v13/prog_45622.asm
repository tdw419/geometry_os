; DESCRIPTION: Draws a black line from (491, 39) to (156, 130).
; PLAN: r0=491(x1), r1=39(y1), r2=156(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 39
LDI r2, 156
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
