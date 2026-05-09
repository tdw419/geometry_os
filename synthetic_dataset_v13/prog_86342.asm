; DESCRIPTION: Composite: Draws a blue line from (157, 102) to (192, 128) then Draws a black circle centered at (338, 146) with radius 64.
; PLAN: r0=157(x1), r1=102(y1), r2=192(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=146(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 102
LDI r2, 192
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 146
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
