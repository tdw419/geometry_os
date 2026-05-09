; DESCRIPTION: Draws a red rectangle at (315, 24) with width 53 and height 57.
; PLAN: r0=315(x), r1=24(y), r2=53(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 24
LDI r2, 53
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
