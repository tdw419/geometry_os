; DESCRIPTION: Draws a black rectangle at (156, 25) with width 70 and height 72.
; PLAN: r0=156(x), r1=25(y), r2=70(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 25
LDI r2, 70
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
