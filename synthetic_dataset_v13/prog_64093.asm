; DESCRIPTION: Draws a blue rectangle at (353, 42) with width 54 and height 95.
; PLAN: r0=353(x), r1=42(y), r2=54(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 42
LDI r2, 54
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
