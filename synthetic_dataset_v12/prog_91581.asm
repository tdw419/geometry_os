; DESCRIPTION: Draws a red rectangle at (74, 67) with width 75 and height 57.
; PLAN: r0=74(x), r1=67(y), r2=75(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 67
LDI r2, 75
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
