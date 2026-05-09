; DESCRIPTION: Draws a red rectangle at (228, 92) with width 105 and height 92.
; PLAN: r0=228(x), r1=92(y), r2=105(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 92
LDI r2, 105
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
