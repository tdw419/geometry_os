; DESCRIPTION: Draws a black rectangle at (436, 46) with width 47 and height 33.
; PLAN: r0=436(x), r1=46(y), r2=47(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 46
LDI r2, 47
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
