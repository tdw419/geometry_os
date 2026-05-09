; DESCRIPTION: Draws a white rectangle at (238, 114) with width 42 and height 73.
; PLAN: r0=238(x), r1=114(y), r2=42(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 114
LDI r2, 42
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
