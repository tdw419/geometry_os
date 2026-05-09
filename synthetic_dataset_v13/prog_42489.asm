; DESCRIPTION: Draws a black rectangle at (60, 139) with width 42 and height 58.
; PLAN: r0=60(x), r1=139(y), r2=42(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 139
LDI r2, 42
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
