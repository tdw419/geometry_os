; DESCRIPTION: Draws a red rectangle at (380, 136) with width 72 and height 119.
; PLAN: r0=380(x), r1=136(y), r2=72(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 136
LDI r2, 72
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
