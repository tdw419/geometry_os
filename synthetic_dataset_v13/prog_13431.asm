; DESCRIPTION: Draws a green rectangle at (227, 64) with width 42 and height 108.
; PLAN: r0=227(x), r1=64(y), r2=42(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 64
LDI r2, 42
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
