; DESCRIPTION: Composite: Places a white circle of radius 53 at center (383, 72) then Draws a orange rectangle at (263, 45) with width 115 and height 36.
; PLAN: r0=383(x), r1=72(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=45(y), r7=115(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 72
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 45
LDI r7, 115
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
