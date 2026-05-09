; DESCRIPTION: Draws a yellow rectangle at (58, 146) with width 11 and height 56.
; PLAN: r0=58(x), r1=146(y), r2=11(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 146
LDI r2, 11
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
