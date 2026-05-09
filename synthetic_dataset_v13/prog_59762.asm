; DESCRIPTION: Draws a yellow rectangle at (69, 108) with width 76 and height 111.
; PLAN: r0=69(x), r1=108(y), r2=76(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 108
LDI r2, 76
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
