; DESCRIPTION: Draws a green rectangle at (30, 1) with width 12 and height 42.
; PLAN: r0=30(x), r1=1(y), r2=12(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 1
LDI r2, 12
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
