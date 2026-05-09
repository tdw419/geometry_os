; DESCRIPTION: Composite: Places a purple dot at position (125, 121) then Draws a yellow rectangle at (162, 153) with width 88 and height 22.
; PLAN: r0=125(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=153(y), r7=88(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 153
LDI r7, 88
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
