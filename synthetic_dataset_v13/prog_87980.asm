; DESCRIPTION: Draws a blue rectangle at (446, 67) with width 38 and height 28.
; PLAN: r0=446(x), r1=67(y), r2=38(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 67
LDI r2, 38
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
