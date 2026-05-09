; DESCRIPTION: Draws a yellow rectangle at (53, 27) with width 11 and height 64.
; PLAN: r0=53(x), r1=27(y), r2=11(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 27
LDI r2, 11
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
