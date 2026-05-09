; DESCRIPTION: Draws a blue rectangle at (318, 173) with width 47 and height 27.
; PLAN: r0=318(x), r1=173(y), r2=47(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 173
LDI r2, 47
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
