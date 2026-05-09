; DESCRIPTION: Draws a red rectangle at (93, 53) with width 48 and height 15.
; PLAN: r0=93(x), r1=53(y), r2=48(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 53
LDI r2, 48
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
