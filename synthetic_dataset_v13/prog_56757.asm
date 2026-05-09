; DESCRIPTION: Draws a blue rectangle at (168, 58) with width 63 and height 14.
; PLAN: r0=168(x), r1=58(y), r2=63(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 58
LDI r2, 63
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
