; DESCRIPTION: Draws a red rectangle at (57, 143) with width 53 and height 35.
; PLAN: r0=57(x), r1=143(y), r2=53(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 143
LDI r2, 53
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
