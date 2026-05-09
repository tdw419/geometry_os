; DESCRIPTION: Draws a yellow rectangle at (57, 166) with width 87 and height 76.
; PLAN: r0=57(x), r1=166(y), r2=87(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 166
LDI r2, 87
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
