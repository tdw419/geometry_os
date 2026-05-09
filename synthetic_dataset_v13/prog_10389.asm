; DESCRIPTION: Draws a yellow rectangle at (143, 13) with width 69 and height 57.
; PLAN: r0=143(x), r1=13(y), r2=69(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 13
LDI r2, 69
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
