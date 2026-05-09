; DESCRIPTION: Draws a blue rectangle at (0, 46) with width 87 and height 62.
; PLAN: r0=0(x), r1=46(y), r2=87(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 46
LDI r2, 87
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
