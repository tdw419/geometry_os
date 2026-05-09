; DESCRIPTION: Draws a blue rectangle at (213, 139) with width 32 and height 46.
; PLAN: r0=213(x), r1=139(y), r2=32(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 139
LDI r2, 32
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
