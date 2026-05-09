; DESCRIPTION: Draws a blue rectangle at (165, 46) with width 34 and height 92.
; PLAN: r0=165(x), r1=46(y), r2=34(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 46
LDI r2, 34
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
