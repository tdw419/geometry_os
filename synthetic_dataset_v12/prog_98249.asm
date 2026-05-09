; DESCRIPTION: Composite: Sets a single black pixel at (7, 110) then Renders a orange box of size 74x53 starting at (226, 58).
; PLAN: r0=7(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=58(y), r7=74(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 110
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 226
LDI r6, 58
LDI r7, 74
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
