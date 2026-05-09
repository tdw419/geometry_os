; DESCRIPTION: Draws a yellow rectangle at (360, 182) with width 93 and height 12.
; PLAN: r0=360(x), r1=182(y), r2=93(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 182
LDI r2, 93
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
