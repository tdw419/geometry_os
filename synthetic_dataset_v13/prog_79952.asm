; DESCRIPTION: Draws a black line from (498, 37) to (426, 183).
; PLAN: r0=498(x1), r1=37(y1), r2=426(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 37
LDI r2, 426
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
