; DESCRIPTION: Draws a black rectangle at (38, 75) with width 99 and height 42.
; PLAN: r0=38(x), r1=75(y), r2=99(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 75
LDI r2, 99
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
