; DESCRIPTION: Draws a red rectangle at (59, 107) with width 67 and height 109.
; PLAN: r0=59(x), r1=107(y), r2=67(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 107
LDI r2, 67
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
