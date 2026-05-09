; DESCRIPTION: Draws a blue rectangle at (346, 94) with width 103 and height 92.
; PLAN: r0=346(x), r1=94(y), r2=103(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 94
LDI r2, 103
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
