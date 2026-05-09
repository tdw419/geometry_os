; DESCRIPTION: Draws a purple rectangle at (239, 57) with width 17 and height 48.
; PLAN: r0=239(x), r1=57(y), r2=17(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 57
LDI r2, 17
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
