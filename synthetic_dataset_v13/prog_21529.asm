; DESCRIPTION: Draws a red rectangle at (53, 16) with width 24 and height 107.
; PLAN: r0=53(x), r1=16(y), r2=24(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 16
LDI r2, 24
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
