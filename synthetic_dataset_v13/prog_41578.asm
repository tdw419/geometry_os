; DESCRIPTION: Draws a blue rectangle at (191, 164) with width 108 and height 42.
; PLAN: r0=191(x), r1=164(y), r2=108(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 164
LDI r2, 108
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
