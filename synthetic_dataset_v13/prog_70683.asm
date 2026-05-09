; DESCRIPTION: Composite: Draws a orange circle centered at (388, 196) with radius 59 then Places a red 53x53 rectangle at position (233, 102).
; PLAN: r0=388(x), r1=196(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=102(y), r7=53(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 196
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 102
LDI r7, 53
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
