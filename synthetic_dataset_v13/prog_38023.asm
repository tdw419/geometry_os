; DESCRIPTION: Draws a blue rectangle at (426, 173) with width 56 and height 82.
; PLAN: r0=426(x), r1=173(y), r2=56(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 173
LDI r2, 56
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
