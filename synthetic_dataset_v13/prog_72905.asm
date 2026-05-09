; DESCRIPTION: Composite: Sets a single white pixel at (43, 100) then Draws a black rectangle at (66, 38) with width 10 and height 114.
; PLAN: r0=43(x), r1=100(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=38(y), r7=10(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 100
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 38
LDI r7, 10
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
