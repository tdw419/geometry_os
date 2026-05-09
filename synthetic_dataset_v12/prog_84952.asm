; DESCRIPTION: Draws a red rectangle at (385, 98) with width 93 and height 67.
; PLAN: r0=385(x), r1=98(y), r2=93(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 98
LDI r2, 93
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
