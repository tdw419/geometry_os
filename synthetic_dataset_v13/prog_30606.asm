; DESCRIPTION: Draws a green rectangle at (108, 109) with width 42 and height 28.
; PLAN: r0=108(x), r1=109(y), r2=42(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 109
LDI r2, 42
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
