; DESCRIPTION: Composite: Draws a black line from (438, 140) to (288, 102) then Draws a magenta circle centered at (246, 26) with radius 19.
; PLAN: r0=438(x1), r1=140(y1), r2=288(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=26(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 140
LDI r2, 288
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 26
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
