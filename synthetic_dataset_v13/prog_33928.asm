; DESCRIPTION: Composite: Places a orange line segment connecting (216, 172) to (49, 165) then Places a white circle of radius 18 at center (197, 192).
; PLAN: r0=216(x1), r1=172(y1), r2=49(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=192(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 172
LDI r2, 49
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 192
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
