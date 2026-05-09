; DESCRIPTION: Draws a red rectangle at (346, 68) with width 114 and height 20.
; PLAN: r0=346(x), r1=68(y), r2=114(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 68
LDI r2, 114
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
