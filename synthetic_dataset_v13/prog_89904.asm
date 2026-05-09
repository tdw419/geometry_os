; DESCRIPTION: Draws a black rectangle at (354, 46) with width 69 and height 94.
; PLAN: r0=354(x), r1=46(y), r2=69(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 46
LDI r2, 69
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
