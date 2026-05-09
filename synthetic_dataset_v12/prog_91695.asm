; DESCRIPTION: Composite: Renders a red line between points (49, 15) and (459, 128) then Draws a black circle centered at (260, 60) with radius 43.
; PLAN: r0=49(x1), r1=15(y1), r2=459(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=60(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 15
LDI r2, 459
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 60
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
