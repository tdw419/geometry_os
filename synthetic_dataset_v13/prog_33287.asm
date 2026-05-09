; DESCRIPTION: Draws a yellow rectangle at (27, 73) with width 78 and height 32.
; PLAN: r0=27(x), r1=73(y), r2=78(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 73
LDI r2, 78
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
