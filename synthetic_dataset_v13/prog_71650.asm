; DESCRIPTION: Composite: Places a black line segment connecting (464, 41) to (271, 134) then Draws a cyan circle centered at (105, 165) with radius 19.
; PLAN: r0=464(x1), r1=41(y1), r2=271(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=165(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 41
LDI r2, 271
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 165
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
