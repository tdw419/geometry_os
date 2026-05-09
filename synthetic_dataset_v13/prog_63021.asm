; DESCRIPTION: Composite: Places a white circle of radius 76 at center (170, 165) then Places a yellow 54x119 rectangle at position (158, 43).
; PLAN: r0=170(x), r1=165(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=43(y), r7=54(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 165
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 43
LDI r7, 54
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
