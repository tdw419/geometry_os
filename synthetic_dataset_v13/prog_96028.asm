; DESCRIPTION: Draws a blue rectangle at (128, 173) with width 120 and height 19.
; PLAN: r0=128(x), r1=173(y), r2=120(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 173
LDI r2, 120
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
