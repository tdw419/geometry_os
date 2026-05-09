; DESCRIPTION: Draws a yellow rectangle at (180, 92) with width 53 and height 37.
; PLAN: r0=180(x), r1=92(y), r2=53(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 92
LDI r2, 53
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
