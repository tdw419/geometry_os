; DESCRIPTION: Draws a black rectangle at (396, 42) with width 92 and height 13.
; PLAN: r0=396(x), r1=42(y), r2=92(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 42
LDI r2, 92
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
