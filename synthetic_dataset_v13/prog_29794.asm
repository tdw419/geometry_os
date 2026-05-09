; DESCRIPTION: Draws a blue rectangle at (148, 68) with width 64 and height 60.
; PLAN: r0=148(x), r1=68(y), r2=64(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 68
LDI r2, 64
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
