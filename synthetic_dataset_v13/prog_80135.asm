; DESCRIPTION: Draws a yellow rectangle at (166, 81) with width 21 and height 82.
; PLAN: r0=166(x), r1=81(y), r2=21(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 81
LDI r2, 21
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
