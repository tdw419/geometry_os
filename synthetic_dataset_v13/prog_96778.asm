; DESCRIPTION: Composite: Draws a orange rectangle at (398, 157) with width 95 and height 74 then Creates a red circular shape at (53, 119) with radius 11.
; PLAN: r0=398(x), r1=157(y), r2=95(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=119(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 157
LDI r2, 95
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 119
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
