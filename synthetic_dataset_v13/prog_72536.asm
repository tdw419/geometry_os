; DESCRIPTION: Draws a red rectangle at (375, 111) with width 29 and height 61.
; PLAN: r0=375(x), r1=111(y), r2=29(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 111
LDI r2, 29
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
