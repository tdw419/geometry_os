; DESCRIPTION: Composite: Sets a single magenta pixel at (76, 137) then Draws a yellow rectangle at (53, 55) with width 36 and height 21.
; PLAN: r0=76(x), r1=137(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=55(y), r7=36(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 137
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 55
LDI r7, 36
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
