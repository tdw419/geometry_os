; DESCRIPTION: Draws a red rectangle at (65, 76) with width 101 and height 111.
; PLAN: r0=65(x), r1=76(y), r2=101(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 76
LDI r2, 101
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
