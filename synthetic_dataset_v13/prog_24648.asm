; DESCRIPTION: Draws a blue rectangle at (383, 173) with width 72 and height 22.
; PLAN: r0=383(x), r1=173(y), r2=72(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 173
LDI r2, 72
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
