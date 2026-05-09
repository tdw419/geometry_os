; DESCRIPTION: Draws a yellow rectangle at (92, 39) with width 62 and height 105.
; PLAN: r0=92(x), r1=39(y), r2=62(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 39
LDI r2, 62
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
