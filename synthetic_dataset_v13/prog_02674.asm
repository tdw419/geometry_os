; DESCRIPTION: Draws a red rectangle at (263, 73) with width 35 and height 78.
; PLAN: r0=263(x), r1=73(y), r2=35(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 73
LDI r2, 35
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
