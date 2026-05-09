; DESCRIPTION: Composite: Creates a black circular shape at (377, 53) with radius 40 then Places a orange line segment connecting (53, 125) to (8, 173).
; PLAN: r0=377(x), r1=53(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=125(y1), r7=8(x2), r8=173(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 53
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 125
LDI r7, 8
LDI r8, 173
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
