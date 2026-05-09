; DESCRIPTION: Draws a red rectangle at (119, 136) with width 112 and height 32.
; PLAN: r0=119(x), r1=136(y), r2=112(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 136
LDI r2, 112
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
