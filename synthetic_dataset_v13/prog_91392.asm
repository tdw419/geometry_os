; DESCRIPTION: Draws a blue rectangle at (253, 154) with width 113 and height 28.
; PLAN: r0=253(x), r1=154(y), r2=113(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 154
LDI r2, 113
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
