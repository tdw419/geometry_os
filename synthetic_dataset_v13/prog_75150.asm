; DESCRIPTION: Draws a green rectangle at (461, 42) with width 29 and height 103.
; PLAN: r0=461(x), r1=42(y), r2=29(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 42
LDI r2, 29
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
