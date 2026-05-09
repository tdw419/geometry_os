; DESCRIPTION: Draws a green rectangle at (157, 22) with width 49 and height 42.
; PLAN: r0=157(x), r1=22(y), r2=49(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 22
LDI r2, 49
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
