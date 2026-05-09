; DESCRIPTION: Draws a yellow rectangle at (282, 98) with width 70 and height 72.
; PLAN: r0=282(x), r1=98(y), r2=70(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 98
LDI r2, 70
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
