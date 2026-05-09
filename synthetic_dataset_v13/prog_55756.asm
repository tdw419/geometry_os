; DESCRIPTION: Draws a black line from (68, 26) to (384, 101).
; PLAN: r0=68(x1), r1=26(y1), r2=384(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 26
LDI r2, 384
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
