; DESCRIPTION: Draws a yellow rectangle at (327, 57) with width 28 and height 72.
; PLAN: r0=327(x), r1=57(y), r2=28(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 57
LDI r2, 28
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
