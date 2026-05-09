; DESCRIPTION: Draws a yellow rectangle at (28, 39) with width 93 and height 36.
; PLAN: r0=28(x), r1=39(y), r2=93(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 39
LDI r2, 93
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
