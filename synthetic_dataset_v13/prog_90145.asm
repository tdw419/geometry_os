; DESCRIPTION: Draws a red rectangle at (226, 126) with width 74 and height 114.
; PLAN: r0=226(x), r1=126(y), r2=74(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 126
LDI r2, 74
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
