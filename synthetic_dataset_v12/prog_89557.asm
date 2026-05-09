; DESCRIPTION: Draws a blue rectangle at (380, 0) with width 101 and height 46.
; PLAN: r0=380(x), r1=0(y), r2=101(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 0
LDI r2, 101
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
