; DESCRIPTION: Draws a yellow rectangle at (395, 39) with width 96 and height 86.
; PLAN: r0=395(x), r1=39(y), r2=96(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 39
LDI r2, 96
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
