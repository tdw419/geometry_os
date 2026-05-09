; DESCRIPTION: Composite: Places a black line segment connecting (157, 53) to (432, 221) then Draws a white circle centered at (420, 118) with radius 64.
; PLAN: r0=157(x1), r1=53(y1), r2=432(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=118(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 53
LDI r2, 432
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 118
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
