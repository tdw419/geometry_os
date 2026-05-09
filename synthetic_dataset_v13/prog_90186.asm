; DESCRIPTION: Draws a yellow rectangle at (436, 200) with width 28 and height 44.
; PLAN: r0=436(x), r1=200(y), r2=28(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 200
LDI r2, 28
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
