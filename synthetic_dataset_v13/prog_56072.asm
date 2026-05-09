; DESCRIPTION: Draws a yellow rectangle at (376, 28) with width 57 and height 100.
; PLAN: r0=376(x), r1=28(y), r2=57(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 28
LDI r2, 57
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
