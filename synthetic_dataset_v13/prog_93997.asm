; DESCRIPTION: Draws a black rectangle at (255, 62) with width 78 and height 42.
; PLAN: r0=255(x), r1=62(y), r2=78(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 62
LDI r2, 78
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
