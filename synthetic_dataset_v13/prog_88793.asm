; DESCRIPTION: Draws a black rectangle at (346, 136) with width 70 and height 93.
; PLAN: r0=346(x), r1=136(y), r2=70(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 136
LDI r2, 70
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
