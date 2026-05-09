; DESCRIPTION: Composite: Draws a white circle centered at (348, 112) with radius 44 then Places a white 43x39 rectangle at position (23, 81).
; PLAN: r0=348(x), r1=112(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=81(y), r7=43(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 112
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 81
LDI r7, 43
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
