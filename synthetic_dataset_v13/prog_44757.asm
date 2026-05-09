; DESCRIPTION: Draws a purple rectangle at (358, 173) with width 113 and height 17.
; PLAN: r0=358(x), r1=173(y), r2=113(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 173
LDI r2, 113
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
