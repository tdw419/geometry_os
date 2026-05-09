; DESCRIPTION: Composite: Places a black line segment connecting (52, 197) to (74, 141) then Draws a white circle centered at (153, 78) with radius 62.
; PLAN: r0=52(x1), r1=197(y1), r2=74(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=78(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 197
LDI r2, 74
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 78
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
