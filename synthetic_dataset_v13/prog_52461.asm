; DESCRIPTION: Draws a magenta rectangle at (284, 128) with width 29 and height 47.
; PLAN: r0=284(x), r1=128(y), r2=29(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 128
LDI r2, 29
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
