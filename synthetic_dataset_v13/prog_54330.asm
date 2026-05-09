; DESCRIPTION: Draws a black line from (286, 164) to (192, 246).
; PLAN: r0=286(x1), r1=164(y1), r2=192(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 164
LDI r2, 192
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
