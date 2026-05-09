; DESCRIPTION: Composite: Sets a single white pixel at (103, 73) then Draws a yellow rectangle at (75, 96) with width 102 and height 59.
; PLAN: r0=103(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=96(y), r7=102(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 96
LDI r7, 102
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
